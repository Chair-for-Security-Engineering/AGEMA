/*
 * -----------------------------------------------------------------
 * COMPANY : Ruhr University Bochum
 * AUTHOR  : Pascal Sasdrich (pascal.sasdrich@rub.de) & Nicolai Müller (nicolai.mueller@rub.de)
 * DOCUMENT: https://eprint.iacr.org/2021/
 * -----------------------------------------------------------------
 *
 * Copyright (c) 2021, David Knichel, Amir Moradi, Niolai Müller, Pascal Sasdrich
 *
 * All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTERS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Please see LICENSE and README for license and further instructions.
 */

/* Setup boost library */
#include "boost/graph/adjacency_list.hpp"
#include "boost/graph/topological_sort.hpp"
#include "boost/algorithm/string.hpp"
#include <boost/multiprecision/cpp_int.hpp>

/* Setup CUDD library */
#include "cudd.h"
#include "cuddObj.hh"

/* Setup SYLVAN library */
#include "sylvan.h"
#include "sylvan_obj.hpp"

/* Setup AIG library */
#define LIN64
#include "aig/aig/aig.h"
#include "gia/gia.h"
#include "gia/giaAig.h"

#include <fstream>
#include <iostream>
#include <map>
#include <chrono>

// Number of monomials must be smaller than ENCODING_SIZE
const unsigned int ENCODING_SIZE = 16384;
BOOST_MP_DEFINE_SIZED_CPP_INT_LITERAL(ENCODING_SIZE);
typedef boost::multiprecision::number<boost::multiprecision::cpp_int_backend<ENCODING_SIZE,ENCODING_SIZE,boost::multiprecision::unsigned_magnitude,boost::multiprecision::unchecked,void>> encoding_data;


struct Anf_Obj{
    // Pair of hash and monomial
    std::map<boost::multiprecision::uint512_t, bool> m;
    int deg = 0;
    int id = 0; // ID between 0 and 256
    int parity = 0;
    int used = 0;
};

/* Define circuit as directed acyclic graph */
struct NodeContext {
    std::string expr;
    std::string name;

    int depth = 0;

    BDD funcCUDD;

    sylvan::Bdd funcBDD;

    Aig_Obj_t* funcAIG;

	Anf_Obj funcANF;
};

typedef boost::adjacency_list<boost::vecS, boost::vecS, boost::bidirectionalS, NodeContext> Circuit;
typedef boost::graph_traits<Circuit>::vertex_descriptor Node;
typedef boost::graph_traits<Circuit>::edge_descriptor Wire;

/* List of supported unary and binary cells */
std::set<std::string> unary  = {"buf", "not", "reg", "regn", "out"};
std::set<std::string> binary = {"and", "nand", "or", "nor", "xor", "xnor"};
std::set<std::string> ternary = {"mux"};

/* Auxiliary functions */
void printProgress(int curr, int max) {
    int barWidth = 100;
    float progress = float(curr) / float(max);

    std::cout << "[";
    int barPos = 100 * progress;
    for (int i = 0; i < barWidth; ++i) {
        if (i < barPos) std::cout << "=";
        else if (i == barPos) std::cout << ">";
        else std::cout << " ";
    }
    std::cout << "] " << int(progress * 100.0) << " %\r";
    std::cout.flush();
}

std::vector<std::string>
split(const std::string line, char delimiter)
{
    // Variable declarations
    std::vector<std::string> tokens;
    std::string token;

    // Turn string into stream
    std::stringstream stream(line);

    // Extract tokens from line
    while(getline(stream, token, delimiter)) {
        tokens.push_back(token);
    }

    return tokens;
}


/* Setup / Close functions */
void setupBDD() {
    /* Start LACE framework (required by Sylvan) */
    lace_init(4, 0);
    lace_startup(0, NULL, NULL);

    /* Start Bdd session (Sylvan library) */
    sylvan::sylvan_set_limits(8*1024*1024*1024ull, 4, 6);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_mtbdd();
    sylvan::sylvan_init_bdd();
}
void closeBDD() {
    sylvan::sylvan_quit();
    lace_exit();
}

Cudd setupCUDD() {
    Cudd cuddManager(0,0,1<<4,1<<16,8*1024*1024*1024ull);
    cuddManager.AutodynEnable(CUDD_REORDER_LAZY_SIFT);
    return cuddManager;
}

Aig_Man_t* setupAIG() {
    /* Start And-Inverted-Graph manager (ABC library) */
    Aig_Man_t * aigManager = Aig_ManStart(1 << 20);
    aigManager->fCatchExor = 1;
    return aigManager;
}

/* Read instructions from .nl file */
Circuit readModelFromInstructions(std::string sourcePath) {

    Circuit model;

    std::ifstream file(sourcePath, std::ios_base::in);
    std::vector<std::string> tokens, annotations;
    std::string line, token;

    if (file)
    {
        /* Parse description line by line */
        while(std::getline(file, line))
        {
            // Split line in tokens
            tokens = split(line, ' ');

            // Add new node to circuit graph
            Node node = add_vertex(model);

            // Label node with parsed type
            model[node].expr = tokens[0];

            // Add new signal(s) to circuit graph model
            if (unary.find(model[node].expr) != unary.end()) {
                add_edge(std::stoi(tokens[1]), node, model);
            } else if (binary.find(model[node].expr) != binary.end()) {
                add_edge(std::stoi(tokens[1]), node, model);
                add_edge(std::stoi(tokens[2]), node, model);
            } else if (ternary.find(model[node].expr) != ternary.end()) {
                add_edge(std::stoi(tokens[1]), node, model);
                add_edge(std::stoi(tokens[2]), node, model);
                add_edge(std::stoi(tokens[3]), node, model);
            }

            // Add name to circuit node
            if (tokens[tokens.size() - 2] == "#") {
                model[node].name = tokens.back();
                model[node].name.erase(std::remove(model[node].name.begin(), model[node].name.end(), '\n'), model[node].name.end());
                model[node].name.erase(std::remove(model[node].name.begin(), model[node].name.end(), '\r'), model[node].name.end());

				std::size_t found1 = model[node].name.find("/*");
                if (found1!=std::string::npos)
                {
				    std::size_t found2 = model[node].name.find("*/");

                   if (found2!=std::string::npos)
                       model[node].name.erase(found1, found2);
				}

                //std::cerr << model[node].name << std::endl;
            }
        }

        file.close();
    }
    else
    {
        std::cerr << "[ERR] Opening file failed." << std::endl;
        return 1;
    }

    std::cout << "[CON] Created " << num_vertices(model) << " gate(s) and " << num_edges(model) << " signal(s)." << std::endl;

    return model;
}

/* Traverse BDDs recursively to collect nodes (Sylvan) */
void bdd2mux (sylvan::Bdd func, std::vector<sylvan::Bdd>& mux, std::map<int, sylvan::Bdd> bddMap) {
    if (!func.isTerminal()) {
        if (std::find(mux.begin(), mux.end(), func) == mux.end()) mux.push_back(func);
        bdd2mux(func.Then(), mux, bddMap);
        bdd2mux(func.Else(), mux, bddMap);
    }
}

/* Convert instructions to verilog (BDD) */
void convertBDD(std::string sourcePath, std::string topmodule, std::string destinationPath) {

    /* Variables */
    int current = 0;

    /* Setup BDD environment */
    setupBDD();

    /* Read circuit model from instructions (.nl) */
    Circuit model = readModelFromInstructions(sourcePath);

    /* Elaborate circuit model to generate BDDs */
    for (auto gate = vertices(model).first; gate != vertices(model).second; ++gate) {

        /* Print progress bar for elaboration */
        printProgress(current++, num_vertices(model) - 1);

        /* Retrieve operand nodes */
        std::vector<Node> operands;
        for (auto w = in_edges(*gate, model).first; w != in_edges(*gate, model).second; w++) operands.push_back(source(*w, model));

        /* Compute logic depth for current node */
        for (int i = 0; i < operands.size(); i++)
            model[*gate].depth = (model[*gate].depth < (model[operands[i]].depth + 1)) ? (model[operands[i]].depth + 1) : model[*gate].depth;

        /* Compute BDDs */
        if (model[*gate].expr == "in") {
            model[*gate].funcBDD  = sylvan::Bdd::bddVar(*gate);
        } else if (model[*gate].expr == "out") {
            model[*gate].funcBDD = model[operands[0]].funcBDD;
        } else if (model[*gate].expr == "reg" || model[*gate].expr == "buf") {
            model[*gate].funcBDD = model[operands[0]].funcBDD;
        } else if (model[*gate].expr == "regn" || model[*gate].expr == "not") {
            model[*gate].funcBDD = !model[operands[0]].funcBDD;
        } else if (model[*gate].expr == "and") {
            model[*gate].funcBDD = (model[operands[0]].funcBDD & model[operands[1]].funcBDD);
        } else if (model[*gate].expr == "nand") {
            model[*gate].funcBDD = !(model[operands[0]].funcBDD & model[operands[1]].funcBDD);
        } else if (model[*gate].expr == "or") {
            model[*gate].funcBDD = (model[operands[0]].funcBDD | model[operands[1]].funcBDD);
        } else if (model[*gate].expr == "nor") {
            model[*gate].funcBDD = !(model[operands[0]].funcBDD | model[operands[1]].funcBDD);
        } else if (model[*gate].expr == "xor") {
            model[*gate].funcBDD = (model[operands[0]].funcBDD ^ model[operands[1]].funcBDD);
        } else if (model[*gate].expr == "xnor") {
            model[*gate].funcBDD = !(model[operands[0]].funcBDD ^ model[operands[1]].funcBDD);
        } else if (model[*gate].expr == "mux") {
            model[*gate].funcBDD = model[operands[0]].funcBDD.Ite(model[operands[2]].funcBDD, model[operands[1]].funcBDD);
        }

    }
    std::cout << "\n[CON] Created " << num_vertices(model) << " BDD(s) in circuit graph." << std::endl;

    /* Collect input and output nodes */
    std::vector<std::string> names, tokens;
    std::map<std::string, std::string> type;
    std::map<std::string, int> min, max;
    std::map<std::string, bool> ready;
    std::vector<Node> inputs, outputs;

    for (auto gate = vertices(model).first; gate != vertices(model).second; ++gate) {
        if (model[*gate].expr == "in" || model[*gate].expr == "out") {
            boost::split(tokens, model[*gate].name, boost::is_any_of("[]"), boost::token_compress_on);

            if (std::find(names.begin(), names.end(), tokens[0]) == names.end()) names.push_back(tokens[0]);

            if (model[*gate].expr == "in") type[tokens[0]] = "input";
            if (model[*gate].expr == "out") type[tokens[0]] = "output";

            if (!ready[tokens[0]]) {
                min[tokens[0]] = std::stoi(tokens[1]);
                max[tokens[0]] = std::stoi(tokens[1]);
                ready[tokens[0]] = true;
            } else if (tokens.size() > 1) {
                min[tokens[0]] = (min[tokens[0]] > std::stoi(tokens[1])) ? std::stoi(tokens[1]) : min[tokens[0]];
                max[tokens[0]] = (max[tokens[0]] < std::stoi(tokens[1])) ? std::stoi(tokens[1]) : max[tokens[0]];
            }

            if (model[*gate].expr == "in") {
                inputs.push_back(*gate);
            } else if (model[*gate].expr == "out") {
                outputs.push_back(*gate);
            }
        }
    }

    /* Search multiplexers */
    std::map<int, sylvan::Bdd> bddMap;
    std::cout << "[CON] Searching multiplexers:" << std::endl;
    std::vector<sylvan::Bdd> mux;
    for (int idx = 0; idx < outputs.size(); idx++) {
        printProgress(idx, outputs.size() - 1);
        bdd2mux(model[outputs[idx]].funcBDD, mux, bddMap);
    }
    std::cout << "\nFound " << mux.size() << " mux(s)." << std::endl;

    /* Output file stream to write verilog circuit */
    std::ofstream netlist(destinationPath);

    /* Write verilog header */
    netlist << "module " << topmodule << "_BDDsylvan ( ";
    for (auto elem : names) { netlist << elem; if (elem != names.back()) netlist << ", "; }
    netlist << " );" << std::endl;

    /* Specify inputs & outputs */
    for (auto elem : names) netlist << "  " << type[elem] << " [" << max[elem] << ":" << min[elem] << "] " << elem << ";" << std::endl;

    /* Mux-2-Signal mapping */
    std::map<sylvan::BDD, std::string> mapping; int gate = 0;
    mapping[sylvan::Bdd::bddZero().GetBDD()] = "1'b0";
    mapping[sylvan::Bdd::bddOne().GetBDD()] = "1'b1";
    for (auto elem : mux) mapping[elem.GetBDD()] = "m" + std::to_string(gate++); gate = 0;

    /* Wires */
    netlist << "  wire "; int w = 0;
    for (auto elem : mux) {
        netlist << "m" << w;
        if (w != (mux.size() - 1)) netlist << ", "; else netlist << ";\n";
        if ((((w + 1) % 10) == 0) && (w != (mux.size() - 1))) netlist << std::endl << "       ";
        w += 1;
    }
    netlist << std::endl;

    /* Multiplexers */
    gate = 0; for (auto elem : mux) {
        netlist << "  MUX2_X1 U" << gate++ << " ( .S( ";
        netlist << model[*std::find_if(vertices(model).first, vertices(model).second, [&model, &elem] (const Node g) {return (model[g].expr == "in") && (model[g].funcBDD.TopVar() == elem.TopVar());})].name;
        netlist << " ), .A( ";
        netlist << mapping[elem.Else().GetBDD()];
        netlist << " ), .B( ";
        netlist << mapping[elem.Then().GetBDD()];
        netlist << " ), .Z( ";
        netlist << mapping[elem.GetBDD()];
        netlist << " ) );";
        netlist << " // var: " << elem.TopVar();
        netlist << ", then: " << elem.Then().TopVar();
        netlist << std::endl;
    }

    /* Final output buffers */
    for (int idx = 0; idx < outputs.size(); idx++) {
        sylvan::Bdd final = model[outputs[idx]].funcBDD;
        while (bddMap.find(final.TopVar()) != bddMap.end()) final = bddMap[final.TopVar()];

        netlist << "  BUF_X1 U" << (mux.size() + idx) << " ( .A( ";
        netlist << mapping[final.GetBDD()];
        netlist << " ), .Z( " << model[outputs[idx]].name << " ) );" << std::endl;
    }

    /* Write verilog footer */
    netlist << "endmodule";

    /* Close file output stream */
    netlist.close();

    /* Clear circuit model */
    model.clear();

    /* Close BDD environment */
    closeBDD();
}

/* Convert instructions to verilog (CUDD) */
void convertCUDD(std::string sourcePath, std::string topmodule, std::string destinationPath) {

    /* Variables */
    int current = 0;

    /* Setup BDD environment */
    Cudd cuddManager = setupCUDD();

    /* Read circuit model from instructions (.nl) */
    Circuit model = readModelFromInstructions(sourcePath);

    /* Elaborate circuit model to generate BDDs */
    for (auto gate = vertices(model).first; gate != vertices(model).second; ++gate) {

        /* Print progress bar for elaboration */
        printProgress(current++, num_vertices(model) - 1);

        /* Retrieve operand nodes */
        std::vector<Node> operands;
        for (auto w = in_edges(*gate, model).first; w != in_edges(*gate, model).second; w++) operands.push_back(source(*w, model));

        /* Compute logic depth for current node */
        for (int i = 0; i < operands.size(); i++)
            model[*gate].depth = (model[*gate].depth < (model[operands[i]].depth + 1)) ? (model[operands[i]].depth + 1) : model[*gate].depth;

        /* Compute CUDDs */
        if (model[*gate].expr == "in") {
            model[*gate].funcCUDD = cuddManager.bddVar(*gate);
        } else if (model[*gate].expr == "out") {
            model[*gate].funcCUDD = model[operands[0]].funcCUDD;
        } else if (model[*gate].expr == "reg" || model[*gate].expr == "buf") {
            model[*gate].funcCUDD = model[operands[0]].funcCUDD;
        } else if (model[*gate].expr == "regn" || model[*gate].expr == "not") {
            model[*gate].funcCUDD = !model[operands[0]].funcCUDD;
        } else if (model[*gate].expr == "and") {
            model[*gate].funcCUDD = (model[operands[0]].funcCUDD & model[operands[1]].funcCUDD);
        } else if (model[*gate].expr == "nand") {
            model[*gate].funcCUDD = !(model[operands[0]].funcCUDD & model[operands[1]].funcCUDD);
        } else if (model[*gate].expr == "or") {
            model[*gate].funcCUDD = (model[operands[0]].funcCUDD | model[operands[1]].funcCUDD);
        } else if (model[*gate].expr == "nor") {
            model[*gate].funcCUDD = !(model[operands[0]].funcCUDD | model[operands[1]].funcCUDD);
        } else if (model[*gate].expr == "xor") {
            model[*gate].funcCUDD = (model[operands[0]].funcCUDD ^ model[operands[1]].funcCUDD);
        } else if (model[*gate].expr == "xnor") {
            model[*gate].funcCUDD = !(model[operands[0]].funcCUDD ^ model[operands[1]].funcCUDD);
        } else if (model[*gate].expr == "mux") {
            model[*gate].funcCUDD = model[operands[0]].funcCUDD.Ite(model[operands[2]].funcCUDD, model[operands[1]].funcCUDD);
        }

    }
    std::cout << "\n[CON] Created " << num_vertices(model) << " BDD(s) in circuit graph." << std::endl;

    /* Disable automatic dynamic variable reordering, but perform final reordering manual */

    cuddManager.AutodynDisable();
    cuddManager.ReduceHeap(CUDD_REORDER_GENETIC);
    //cuddManager.ReduceHeap(CUDD_REORDER_SIFT);


    /* Collect input and output nodes */
    std::vector<std::string> names, tokens;
    std::map<std::string, std::string> type;
    std::map<std::string, int> min, max;
    std::map<std::string, bool> ready;
    std::vector<Node> inputs, outputs;

    for (auto gate = vertices(model).first; gate != vertices(model).second; ++gate) {
        if (model[*gate].expr == "in" || model[*gate].expr == "out") {
            boost::split(tokens, model[*gate].name, boost::is_any_of("[]"), boost::token_compress_on);

            if (std::find(names.begin(), names.end(), tokens[0]) == names.end()) names.push_back(tokens[0]);

            if (model[*gate].expr == "in") type[tokens[0]] = "input";
            if (model[*gate].expr == "out") type[tokens[0]] = "output";

            if (!ready[tokens[0]]) {
                min[tokens[0]] = std::stoi(tokens[1]);
                max[tokens[0]] = std::stoi(tokens[1]);
                ready[tokens[0]] = true;
            } else if (tokens.size() > 1) {
                min[tokens[0]] = (min[tokens[0]] > std::stoi(tokens[1])) ? std::stoi(tokens[1]) : min[tokens[0]];
                max[tokens[0]] = (max[tokens[0]] < std::stoi(tokens[1])) ? std::stoi(tokens[1]) : max[tokens[0]];
            }

            if (model[*gate].expr == "in") {
                inputs.push_back(*gate);
            } else if (model[*gate].expr == "out") {
                outputs.push_back(*gate);
            }
        }
    }

    /* Search multiplexers */
    std::cout << "[CON] Searching multiplexers:" << std::endl;
    std::set<DdNode*> mux; DdGen* gen; DdNode* node;
    for (int idx = 0; idx < outputs.size(); idx++) {
        printProgress(idx, outputs.size() - 1);
        Cudd_ForeachNode(cuddManager.getManager(), model[outputs[idx]].funcCUDD.Add().getNode(), gen, node) mux.insert(node);
    }
    mux.erase(cuddManager.addZero().getNode());
    mux.erase(cuddManager.addOne().getNode());
    std::cout << "\nFound " << mux.size() << " mux(s)." << std::endl;

    /* Output file stream to write verilog circuit */
    std::ofstream netlist(destinationPath);

    /* Write verilog header */
    netlist << "module " << topmodule << "_BDDcudd ( ";
    for (auto elem : names) { netlist << elem; if (elem != names.back()) netlist << ", "; }
    netlist << " );" << std::endl;

    /* Specify inputs & outputs */
    for (auto elem : names) netlist << "  " << type[elem] << " [" << max[elem] << ":" << min[elem] << "] " << elem << ";" << std::endl;

    /* Mux-2-Signal mapping */
    std::map<DdNode*, std::string> mapping; int gate = 0;
    mapping[cuddManager.bddZero().Add().getNode()] = "1'b0";
    mapping[cuddManager.bddOne().Add().getNode()] = "1'b1";
    for (auto elem : mux) mapping[elem] = "m" + std::to_string(gate++); gate = 0;

    /* Wires */
    netlist << "  wire "; int w = 0;
    for (auto elem : mux) {
        netlist << "m" << w;
        if (w != (mux.size() - 1)) netlist << ", "; else netlist << ";\n";
        if ((((w + 1) % 10) == 0) && (w != (mux.size() - 1))) netlist << std::endl << "       ";
        w += 1;
    }
    netlist << "\n";

    /* Multiplexers */
    gate = 0; for (auto elem : mux) {
        netlist << "  MUX2_X1 U" << gate++ << " ( .S( ";
        netlist << model[*std::find_if(vertices(model).first, vertices(model).second, [&model, &elem] (const Node& n) {return (model[n].expr == "in") && (model[n].funcCUDD.Add().NodeReadIndex() == Cudd_NodeReadIndex(elem));})].name;
        netlist << " ), .A( ";
        netlist << mapping[Cudd_E(elem)];
        netlist << " ), .B( ";
        netlist << mapping[Cudd_T(elem)];
        netlist << " ), .Z( ";
        netlist << mapping[elem];
        netlist << " ) );";
        netlist << "\n";
    }

    /* Final output buffers */
    for (int idx = 0; idx < outputs.size(); idx++) {
        netlist << "  BUF_X1 U" << (mux.size() + idx) << " ( .A( ";
        netlist << mapping[model[outputs[idx]].funcCUDD.Add().getNode()];
        netlist << " ), .Z( " << model[outputs[idx]].name << " ) );\n";
    }

    /* Write verilog footer */
    netlist << "endmodule";

    /* Close file output stream */
    netlist.close();

    /* Clear circuit model */
    model.clear();
}

/* Convert instructions to verilog (AIG) */
void convertAIG(std::string sourcePath, std::string topmodule, std::string destinationPath) {

    /* Variables */
    std::map<int, std::string> ioMap;
    int current = 0, ioNum = 0;

    /* Setup BDD environment */
    Aig_Man_t* aigManager = setupAIG();

    /* Read circuit model from instructions (.nl) */
    Circuit model = readModelFromInstructions(sourcePath);

    /* Elaborate circuit model to generate BDDs */
    for (auto gate = vertices(model).first; gate != vertices(model).second; ++gate) {

        /* Print progress bar for elaboration */
        printProgress(current++, num_vertices(model) - 1);

        /* Retrieve operand nodes */
        std::vector<Node> operands;
        for (auto w = in_edges(*gate, model).first; w != in_edges(*gate, model).second; w++) operands.push_back(source(*w, model));

        /* Compute logic depth for current node */
        for (int i = 0; i < operands.size(); i++)
            model[*gate].depth = (model[*gate].depth < (model[operands[i]].depth + 1)) ? (model[operands[i]].depth + 1) : model[*gate].depth;

        /* Compute AIGs */
        if (model[*gate].expr == "in") {
            model[*gate].funcAIG = Aig_ObjCreateCi(aigManager);
            model[*gate].funcAIG->CioId = ioNum;
            ioMap[ioNum++] = model[*gate].name;
        } else if (model[*gate].expr == "out") {
            model[*gate].funcAIG = Aig_ObjCreateCo(aigManager, model[operands[0]].funcAIG);
            model[*gate].funcAIG->CioId = ioNum;
            ioMap[ioNum++] = model[*gate].name;
        } else if (model[*gate].expr == "reg" || model[*gate].expr == "buf") {
            model[*gate].funcAIG = model[operands[0]].funcAIG;
        } else if (model[*gate].expr == "regn" || model[*gate].expr == "not") {
            model[*gate].funcAIG = Aig_Not(model[operands[0]].funcAIG);
        } else if (model[*gate].expr == "and") {
            model[*gate].funcAIG = Aig_And(aigManager, model[operands[0]].funcAIG, model[operands[1]].funcAIG);
        } else if (model[*gate].expr == "nand") {
            model[*gate].funcAIG = Aig_Not(Aig_And(aigManager, model[operands[0]].funcAIG, model[operands[1]].funcAIG));
        } else if (model[*gate].expr == "or") {
            model[*gate].funcAIG = Aig_Or(aigManager, model[operands[0]].funcAIG, model[operands[1]].funcAIG);
        } else if (model[*gate].expr == "nor") {
            model[*gate].funcAIG = Aig_Not(Aig_Or(aigManager, model[operands[0]].funcAIG, model[operands[1]].funcAIG));
        } else if (model[*gate].expr == "xor") {
            model[*gate].funcAIG = Aig_Exor(aigManager, model[operands[0]].funcAIG, model[operands[1]].funcAIG);
        } else if (model[*gate].expr == "xnor") {
            model[*gate].funcAIG = Aig_Not(Aig_Exor(aigManager, model[operands[0]].funcAIG, model[operands[1]].funcAIG));
        } else if (model[*gate].expr == "mux") {
            model[*gate].funcAIG = Aig_Mux(aigManager, model[operands[0]].funcAIG, model[operands[2]].funcAIG, model[operands[1]].funcAIG);
        }
    }
    std::cout << "\n[CON] Created " << num_vertices(model) << " AIG(s) in circuit graph." << std::endl;

    /* Collect input and output nodes */
    std::vector<std::string> names, tokens;
    std::map<std::string, std::string> type;
    std::map<std::string, int> min, max;
    std::map<std::string, bool> ready;
    std::vector<Node> inputs, outputs;

    for (auto gate = vertices(model).first; gate != vertices(model).second; ++gate) {
        if (model[*gate].expr == "in" || model[*gate].expr == "out") {
            boost::split(tokens, model[*gate].name, boost::is_any_of("[]"), boost::token_compress_on);

            if (std::find(names.begin(), names.end(), tokens[0]) == names.end()) names.push_back(tokens[0]);

            if (model[*gate].expr == "in") type[tokens[0]] = "input";
            if (model[*gate].expr == "out") type[tokens[0]] = "output";

            if (!ready[tokens[0]]) {
                min[tokens[0]] = std::stoi(tokens[1]);
                max[tokens[0]] = std::stoi(tokens[1]);
                ready[tokens[0]] = true;
            } else if (tokens.size() > 1) {
                min[tokens[0]] = (min[tokens[0]] > std::stoi(tokens[1])) ? std::stoi(tokens[1]) : min[tokens[0]];
                max[tokens[0]] = (max[tokens[0]] < std::stoi(tokens[1])) ? std::stoi(tokens[1]) : max[tokens[0]];
            }

            if (model[*gate].expr == "in") {
                inputs.push_back(*gate);
            } else if (model[*gate].expr == "out") {
                outputs.push_back(*gate);
            }
        }
    }

    /* Search ands, xors, and nots */
    std::set<Aig_Obj_t *> ands, xors, nots;
    int i = 0; Aig_Obj_t * obj;
    Aig_ManForEachObj(aigManager, obj, i) {
        printProgress(i, Aig_ManObjNum(aigManager) - 1);
        if (Aig_ObjIsAnd(obj)) ands.insert(obj);
        if (Aig_ObjIsExor(obj)) xors.insert(obj);
        if (Aig_ObjIsAnd(obj) && Aig_ObjFaninC0(obj)) nots.insert(Aig_ObjChild0(obj));
        if (Aig_ObjIsAnd(obj) && Aig_ObjFaninC1(obj)) nots.insert(Aig_ObjChild1(obj));
        if (Aig_ObjIsExor(obj) && Aig_ObjFaninC0(obj)) nots.insert(Aig_ObjChild0(obj));
        if (Aig_ObjIsExor(obj) && Aig_ObjFaninC1(obj)) nots.insert(Aig_ObjChild1(obj));
        if (Aig_ObjIsCo(obj) && Aig_ObjFaninC0(obj)) nots.insert(Aig_ObjChild0(obj));
    }
    std::cout << "\n[CON] Found " << ands.size() << " and(s), " << xors.size() << " xor(s), and " << nots.size() << " not(s)." << std::endl;

    /* Output file stream to write verilog circuit */
    std::ofstream netlist(destinationPath);

    /* Write verilog header */
    netlist << "module " << topmodule << "_AIG ( ";
    for (auto elem : names) { netlist << elem; if (elem != names.back()) netlist << ", "; }
    netlist << " );" << std::endl;

    /* Specify inputs & outputs */
    for (auto elem : names) netlist << "  " << type[elem] << " [" << max[elem] << ":" << min[elem] << "] " << elem << ";" << std::endl;

    /* Aig-2-Signal mapping */
    std::map<Aig_Obj_t *, std::string> mapping; int gate = 0;
    for (Aig_Obj_t * obj : nots) mapping[obj] = "n" + std::to_string(gate++);
    for (Aig_Obj_t * obj : ands) mapping[obj] = "a" + std::to_string(gate++);
    for (Aig_Obj_t * obj : xors) mapping[obj] = "x" + std::to_string(gate++);

    /* Wires */
    netlist << "  wire "; int w = 0;
    for (auto elem : mapping) {
        netlist << elem.second;
        if (w != (gate - 1)) netlist << ", "; else netlist << ";\n";
        if ((((w + 1) % 10) == 0) && (w != (gate - 1))) netlist << std::endl << "       ";
        w += 1;
    }
    netlist << std::endl;

    /* Add inputs to Aig-2-Signal mapping */
    i = 0; Aig_ManForEachCi(aigManager, obj, i) mapping[obj] = ioMap[obj->CioId];

    /* Inverters */
    gate = 0;
    for (Aig_Obj_t * obj : nots) {
        netlist << "  INV_X1 U" << gate++ << " ( .A( ";
        netlist << mapping[Aig_Regular(obj)];
        netlist << " ), .ZN( ";
        netlist << mapping[obj];
        netlist << " ) );";
        netlist << std::endl;
    }

    /* Ands */
    for (Aig_Obj_t * obj : ands) {
        netlist << "  AND2_X1 U" << gate++ << " ( .A1( ";
        netlist << mapping[Aig_ObjChild0(obj)];
        netlist << " ), .A2( ";
        netlist << mapping[Aig_ObjChild1(obj)];
        netlist << " ), .ZN( ";
        netlist << mapping[obj];
        netlist << " ) );";
        netlist << std::endl;
    }

    /* Xors */
    for (Aig_Obj_t * obj : xors) {
        netlist << "  XOR2_X1 U" << gate++ << " ( .A( ";
        netlist << mapping[Aig_ObjChild0(obj)];
        netlist << " ), .B( ";
        netlist << mapping[Aig_ObjChild1(obj)];
        netlist << " ), .Z( ";
        netlist << mapping[obj];
        netlist << " ) );";
        netlist << std::endl;
    }

    /* Final output buffers */
    i = 0; Aig_ManForEachCo(aigManager, obj, i) {
        netlist << "  BUF_X1 U" << (gate + i) << " ( .A( ";
        netlist << mapping[Aig_ObjChild0(obj)];
        netlist << " ), .Z( " << ioMap[obj->CioId] << " ) );" << std::endl;
    }

    /* Write verilog footer */
    netlist << "endmodule";

    /* Close file output stream */
    netlist.close();

    /* Clear circuit model */
    model.clear();
}

void insert_xor(Circuit& c, Node& x, Node& y, Node& z, std::pair<std::map<boost::multiprecision::uint512_t, bool>::iterator,bool>& it){
    auto it1 = c[x].funcANF.m.begin();
    auto it2 = c[y].funcANF.m.begin();

    // Search for all monomials that occur twice
    while(it1 != c[x].funcANF.m.end() && it2 != c[y].funcANF.m.end()){
        if(it1->first > it2->first){
            it2++;
        }else if(it1->first == it2->first){
            it1->second = !it1->second;
            it2->second = !it2->second;
            it1++;
            it2++;
        }else{
            it1++;
        }
    }

    // Insert all monomials that not occur twice
    for(auto &monomial : c[x].funcANF.m){
        if(monomial.second){
            c[z].funcANF.m.insert(monomial);
        }else{
            monomial.second = true;
        }
    }

    for(auto &monomial : c[y].funcANF.m){
        if(monomial.second){
            c[z].funcANF.m.insert(monomial);
        }else{
            monomial.second = true;
        }
    }

    // Compute parity
    c[z].funcANF.parity ^= c[x].funcANF.parity ^ c[y].funcANF.parity;
}

void insert_xor_small(std::map<boost::multiprecision::uint512_t, bool>& x, std::map<boost::multiprecision::uint512_t, bool>& y, std::map<boost::multiprecision::uint512_t, bool>& z, std::pair<std::map<boost::multiprecision::uint512_t, bool>::iterator,bool>& it){
    auto it1 = x.begin();
    auto it2 = y.begin();

    // Search for all monomials that occur twice
    while(it1 != x.end() && it2 != y.end()){
        if(it1->first > it2->first){
            it2++;
        }else if(it1->first == it2->first){
            it1->second = !it1->second;
            it2->second = !it2->second;
            it1++;
            it2++;
        }else{
            it1++;
        }
    }

    // Insert all monomials that not occur twice
    for(auto &monomial : x){
        if(monomial.second){
           z.insert(monomial);
        }else{
            monomial.second = true;
        }
    }

    for(auto &monomial : y){
        if(monomial.second){
            z.insert(monomial);
        }else{
            monomial.second = true;
        }
    }
}

// Performs an and gate on two inputs and xors the result to z
void insert_and(Circuit& c, Node& x, Node& y, Node& z, std::pair<std::map<boost::multiprecision::uint512_t, bool>::iterator,bool>& it){
    std::map<boost::multiprecision::uint512_t, bool> mon, px;
    boost::multiprecision::uint512_t mon_xy;

    // Loop over all monomials from both inputs
    if(!c[x].funcANF.parity && !c[y].funcANF.parity){
        for(auto &mon_x : c[x].funcANF.m){
            for (auto &mon_y : c[y].funcANF.m){

                // Merge two monomials together
                mon_xy = mon_x.first | mon_y.first;

                // Push new monomial to list
                it = c[z].funcANF.m.insert({mon_xy,true});

                // If the key already exists delete the key
                if(!it.second){c[z].funcANF.m.erase(it.first);}
            }
        }
    }else{
        for(auto mon_x : c[x].funcANF.m){
            for (auto mon_y : c[y].funcANF.m){

                // Merge two monomials together
                mon_xy = mon_x.first | mon_y.first;

                // Push new monomial to list
                it = mon.insert({mon_xy,true});

                // If the key already exists delete the key
                if(!it.second){mon.erase(it.first);}
            }
        }

        if(c[x].funcANF.parity && c[y].funcANF.parity){
            insert_xor_small(c[y].funcANF.m, mon, px, it);
            insert_xor_small(c[x].funcANF.m, px, c[z].funcANF.m, it);
        }else if(c[x].funcANF.parity && !c[y].funcANF.parity){
            insert_xor_small(c[y].funcANF.m, mon, c[z].funcANF.m, it);
        }else{
            insert_xor_small(c[x].funcANF.m, mon, c[z].funcANF.m, it);
        }
    }

    // Add the inversion bit result of the and gate
    c[z].funcANF.parity ^=  c[x].funcANF.parity & c[y].funcANF.parity;
}

unsigned int hw(boost::multiprecision::uint512_t x){
    unsigned int y = 0, n = 0;

    for (size_t i = 0; i < 16; i++){
        y = (unsigned int)(x & 0xffffffff);
        n += __builtin_popcount(y);
        x >>= 32;
    }

    return n;
}

void SimulatedAnnealing(std::vector<encoding_data>& equations, std::vector<std::vector<encoding_data>>& state){
    // Give simulated annealing parameters
    double T = 1.0, Tmin = 0.5, alpha = 0.90, I = 1, rnd = 0.0;
    unsigned int numIterations = 100, random_value = 0, random_eq1 = 0, random_eq2 = 0, random_op1 = 0, random_op2 = 0;
    long delta_area = 0, input_area = 0, prev_area = 0, state_area = 0, best_area;

    srand(time(NULL));

    encoding_data random_mon1 = 0, random_mon2 = 0;
    std::vector<encoding_data> tmp_equation;

    // Get matrices that define the gadget
    std::vector<std::vector<encoding_data>> prev;
    std::set<encoding_data> set_of_sums;

    // Compute the initial solution
    set_of_sums.clear();

    for(auto operand : equations){
        set_of_sums.insert(operand);
    }

    for (auto result : set_of_sums){
        tmp_equation.clear();
        tmp_equation.push_back(result);
        prev.push_back(tmp_equation);
    }

    prev_area = set_of_sums.size();
    best_area = prev_area;
    state = prev;

    // Start with simulated annealing
    while(T > Tmin){
        I++;

        for (size_t i = 0; i < numIterations*I; i++){

            // Get two random equations
            random_value = rand() & 0xff;
            random_value |= (rand() & 0xff) << 8;
            random_value |= (rand() & 0xff) << 16;
            random_value |= (rand() & 0xff) << 24;

            //_rdrand32_step(&random_value);
            random_eq1 = (random_value & 0xffff) % state.size();
            random_eq2 = ((random_value >> 16) & 0xfff) % state.size();

            // Get two random operands from the equation
            random_value = rand() & 0xff;
            random_value |= (rand() & 0xff) << 8;
            random_value |= (rand() & 0xff) << 16;
            random_value |= (rand() & 0xff) << 24;

            //_rdrand32_step(&random_value);
            random_op1 = (random_value & 0xffff) % state[random_eq1].size();
            random_op2 = ((random_value >> 16) & 0xfff) % state[random_eq2].size();

            // Save copy
            random_mon1 = state[random_eq1][random_op1];
            random_mon2 = state[random_eq2][random_op2];

            set_of_sums.clear();

            // Check all equations for the first operand
            for(auto &equation : state){
                auto it1 = std::find(equation.begin(), equation.end(), random_mon1);

                // If the operand is found we add operand two
                if(it1 != equation.end()){

                    // Sum both operands
                    *it1 ^= random_mon2;

                    // Erase zero terms
                    if(*it1 == 0){equation.erase(it1);}

                    auto it2 = std::find(equation.begin(), equation.end(), random_mon2);

                    // Check if the second operand also occurs in the equation
                    if(it2 == equation.end()){
                        equation.push_back(random_mon2);
                    }else{
                        equation.erase(it2);
                    }
                }

                for(auto &operand : equation){
                    set_of_sums.insert(operand);
                }
            }

            // Compute the state area
            state_area = set_of_sums.size();

            // Compute area difference
            delta_area = state_area - prev_area;

            rnd = (double) rand()/RAND_MAX;

            if(state_area <= prev_area || exp(-(delta_area/T)) > rnd){
                prev = state;
                prev_area = state_area;
            }else{
                state = prev;
                state_area = prev_area;
            }
        }

        // Cool down T
        T *= alpha;
    }

    if(prev_area < state_area){
        state_area = prev_area;
        state = prev;
    }
}

void convertANF(std::string sourcePath, std::string topmodule, std::string destinationPath, bool low_latency, bool pipeline, std::string LibraryPath) {
    // Read circuit model from instructions (.nl)
    Circuit model = readModelFromInstructions(sourcePath);

    std::vector<Node> gates, braces_gates, input_gates, output_gates, anf_input_gates, anf_output_gates, op, inter;

    // Store a computed monomial
    boost::multiprecision::uint512_t mon = 1, input_bits = 0, gadget_area = 0, gadget_inputs = 0, total_area = 0;
    encoding_data temporary_monomial = 0, tmp_mon = 0;

    // Set of monomials required per stage
    std::map<boost::multiprecision::uint512_t, boost::multiprecision::uint512_t> mons_set_rev;
    std::map<boost::multiprecision::uint512_t, encoding_data> real_to_subst_mon;
    std::map<encoding_data, boost::multiprecision::uint512_t> subst_to_real_mon;
    std::map<boost::multiprecision::uint512_t, unsigned int> deg_list;
    std::map<std::string, unsigned int> input_list, output_list;

    std::map<boost::multiprecision::uint512_t, boost::multiprecision::uint512_t>::iterator it1, it2;
    std::vector<std::vector<std::string>> names0(512), names1(512);
    std::set<std::string> input_names;

    std::pair<std::map<boost::multiprecision::uint512_t, std::vector<boost::multiprecision::uint512_t>>::iterator,bool> it_grp;
    std::pair<std::map<boost::multiprecision::uint512_t, bool>::iterator,bool> it;

    std::set<size_t> id_list;
    std::set<boost::multiprecision::uint512_t> mon_set1, mon_set2;
    std::string name1, name2, name3, term_string;
    std::vector<std::string> module_definition, reduction_terms, gadget_definition, input_registers;

    encoding_data tmp_subterm = 0, tmp_subterm2 = 0;

    // Check if an intermediate anf is not computed yet
    unsigned int intermediate_ctr = 0, randomness = 0, randomness_old = 0, randomness_ll = 0, randomness_ll_old, done = 0, tmp_ctr = 0, inputs_done = 1, output_ctr = 0, gadget_ctr = 0, ctr = 0, l = 0, l2 = 0, tmp_parity = 0, maximum_degree = 0, id_ctr = 0, nr_inputs = 0, nr_inputs2 = 0, nr_inputs_sum = 0;
    bool node_exists = false, node_exists_in_list = false, node_in_list = false, same_monomials = false, found = false;

    Node tmp1 = add_vertex(model);
    Node tmp2 = add_vertex(model);

    model[tmp1].expr = "tmp";
    model[tmp2].expr = "tmp";

    // Create new folder
    //std::string directory_path = sourcePath.substr(0, sourcePath.find_last_of("/")) + "/" + topmodule + "_ANF";
    //std::filesystem::create_directory(directory_path);
    std::string directory_path = sourcePath.substr(0, sourcePath.find_last_of("/"));

    // Output file stream to write verilog circuit
    destinationPath = directory_path + "/" + topmodule + "_ANF.v";
    std::ofstream netlist(destinationPath);

    std::string destinationPath2, destinationPath3;
    destinationPath2 = directory_path + "/" + topmodule + "_GHPC_Step1.vhd";
    destinationPath3 = directory_path + "/" + topmodule + "_GHPC_Gadget.vhd";

    // Output file stream to write vhdl ghpc modules
    std::ofstream netlist2(destinationPath2);
    std::ofstream netlist3(destinationPath3);

    // Search for all nodes connected to the root node
    for (auto g = vertices(model).first; g != vertices(model).second; ++g) {gates.push_back(*g);}

    // Initialize input anf function
    for(auto &gate : gates){
        // Check if the gate provides an input variable
        if(model[gate].expr == "in" || model[gate].expr == "ref"){
            // Set the monomial
            model[gate].funcANF.m.insert({mon,true});
            model[gate].funcANF.id = id_ctr;
            mon <<= 1;
            id_ctr++;

            model[gate].funcANF.used = 1;
            model[gate].depth = 1;

            // List all gates that hold an input
            input_gates.push_back(gate);
        }else if(model[gate].expr == "out"){

            // List all gates that hold an output
            output_gates.push_back(gate);
        }
    }

    // Rename the inputs
    for(auto &gate : input_gates){
        input_names.insert(model[gate].name);
    }

    for(auto name : input_names){
        for(auto &gate : input_gates){
            if(model[gate].name == name){
                model[gate].name = "in[" + std::to_string(tmp_ctr) + "]";
                tmp_ctr++;
            }
        }
    }

    netlist << "// assign in = { ";

    while(input_names.size() != 0){
        auto name_it = prev(input_names.end());

        if(input_names.size() == 1){
            netlist << *name_it << " };" << std::endl;
        }else{
            netlist << *name_it << ", ";
        }

        input_names.erase(name_it);
    }

    tmp_ctr = 0;
    input_names.clear();

    // Rename the output
    for(auto &gate : output_gates){
        input_names.insert(model[gate].name);
    }

    for(auto name : input_names){
        for(auto &gate : output_gates){
            if(model[gate].name == name){
                model[gate].name = "out[" + std::to_string(tmp_ctr) + "]";
                tmp_ctr++;
            }
        }
    }

    netlist << "// assign  { ";

    while(input_names.size() != 0){
        auto name_it = prev(input_names.end());

        if(input_names.size() == 1){
            netlist << *name_it << " } = out;" << std::endl;
        }else{
            netlist << *name_it << ", ";
        }

        input_names.erase(name_it);
    }

    tmp_ctr = 0;

    // Start clock for the anf computation
    auto start_anf = std::chrono::high_resolution_clock::now();

    // Compute all anfs based on intermediates
    while(!done){
        done = 1;

        // Loop over all gates in the circuit
        for(Node gate : gates){

            // Check if the gate is not computed in a stage
            if(!model[gate].funcANF.used && model[gate].expr != "tmp"){
                inputs_done = 1;

                // Get all inputs of the current gate and check if they are all computed
                for (auto w = in_edges(gate, model).first; w != in_edges(gate, model).second; w++){
                    op.push_back(source(*w, model));
                    inputs_done &= model[source(*w, model)].funcANF.used;
                }

                if(inputs_done){
                    // Set parity if necessary
                    if(model[gate].expr == "nand" || model[gate].expr == "nor" || model[gate].expr == "xnor" || model[gate].expr == "not"){model[gate].funcANF.parity = 1;}

                    if (model[gate].expr == "not" || model[gate].expr == "buf" || model[gate].expr == "reg" || model[gate].expr == "out"){
                        model[gate].funcANF.m = model[op[0]].funcANF.m;
                        model[gate].funcANF.parity ^= model[op[0]].funcANF.parity;
                    } else if(model[gate].expr == "xor" || model[gate].expr == "xnor"){
                        insert_xor(model, op[0], op[1], gate, it);
                    } else if (model[gate].expr == "and" || model[gate].expr == "nand"){
                        insert_and(model, op[0], op[1], gate, it);
                    } else if(model[gate].expr == "or" || model[gate].expr == "nor"){
                        // (x or y) = ~(~a and ~b)
                        model[op[0]].funcANF.parity ^= 1;
                        model[op[1]].funcANF.parity ^= 1;

                        insert_and(model, op[0], op[1], gate, it);

                        model[op[0]].funcANF.parity ^= 1;
                        model[op[1]].funcANF.parity ^= 1;
                        model[gate].funcANF.parity ^= 1;
                    } else if (model[gate].expr == "mux"){
                        model[tmp1].funcANF.m.clear();
                        model[tmp2].funcANF.m.clear();
                        model[tmp1].funcANF.parity = 0;
                        model[tmp2].funcANF.parity = 0;

                        insert_xor(model, op[1], op[2], tmp1, it);
                        insert_and(model, tmp1,  op[0], tmp2, it);
                        insert_xor(model, tmp2,  op[1], gate, it);
                    } else {
                        std::cout << "[ERROR] Gate " << model[gate].expr << " is not supported!" << std::endl;
                    }

                    // Now the gate is computed
                    model[gate].funcANF.used = 1;
                }
                op.clear();
            }
        }

        // Check if all outputs are computed in this stage
        for(auto gate : output_gates){done &= model[gate].funcANF.used;}
    }

    // Stop the time for the anf computation
    auto finish_anf = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed_anf = finish_anf - start_anf;
    std::cout << "[" << elapsed_anf.count() << "] ANFs finished!" << std::endl;

    // Start time for characterisation
    auto start_ex = std::chrono::high_resolution_clock::now();

    // Compute maximum algebraic degree
    for(auto &gate : output_gates){
        for(auto &monomial : model[gate].funcANF.m){
            deg_list.insert({monomial.first,hw(monomial.first)});
            if(deg_list[monomial.first] > maximum_degree){maximum_degree = deg_list[monomial.first];}
        }
    }

    std::cout << "Maximum algebraic degree: " << maximum_degree << std::endl;

    // Build disjunct groups out of the monomials
    for(size_t d = maximum_degree; d > 0; d--){
        output_ctr = 0;
        for(auto &gate : output_gates){
            for(auto &monomial : model[gate].funcANF.m){

                if(hw(monomial.first) == d && mons_set_rev.find(monomial.first) == mons_set_rev.end()){
                    found = false;

                    for(auto &max_monomial : mons_set_rev){

                        // Compute the number of bits of the existing monomial
                        mon = monomial.first ^ max_monomial.first;

                        // Compute the number of bits of the sum
                        nr_inputs = hw(mon);

                        // Check if both monomials are disjunct
                        if((hw(monomial.first) + hw(max_monomial.first)) > nr_inputs){
                            mons_set_rev.insert({monomial.first,max_monomial.second});
                            found = true;
                            break;
                        }
                    }

                    if(!found){
                        if(deg_list[monomial.first] > 1){
                            gadget_ctr++;
                            mons_set_rev.insert({monomial.first,gadget_ctr});
                        }else{
                            // Translate the monomial back to input values
                            l = 0;
                            mon = monomial.first;

                            while (mon > 0){
                                if(boost::multiprecision::bit_test(mon, l)){

                                    // Iterate over all inputs to find the correct id
                                    for (auto input : input_gates){
                                        if(model[input].funcANF.id == l){
                                            auto string_it = model[input].name.find("[");
                                            std::string snippet0, snippet1;

                                            if(string_it != std::string::npos){
                                                snippet0 = model[input].name;
                                                snippet0.insert(string_it, "0");
                                                snippet1 = model[input].name;
                                                snippet1.insert(string_it, "1");
                                            }else{
                                                snippet0 = model[input].name + "0";
                                                snippet1 = model[input].name + "1";
                                            }

                                            names0[output_ctr].push_back(snippet0);
                                            names1[output_ctr].push_back(snippet1);
                                        }
                                    }

                                    boost::multiprecision::bit_flip(mon, l);
                                }
                                l++;
                            }
                        }
                    }
                }
            }

            output_ctr++;
        }
    }

    std::map<std::string, std::string> already_registered_values0, already_registered_values1;
    std::string reg_expr;

    // Insert registers for inputs
    if(pipeline){
    tmp_ctr = 0;
    for (auto& function : names0){
        if(!function.empty()){
        term_string.clear();
        std::string snippet0, snippet1;
        snippet0 = "r0_" + std::to_string(tmp_ctr);

        term_string += "  wire " + snippet0 + ";\n";
        term_string += "  assign " + snippet0 + " = ";

        reg_expr.clear();
        while(!function.empty()){
            if(function.size() > 1){
                term_string += function.back() + " ^ ";
                reg_expr += function.back() + " ^ ";
            }else{
                term_string += function.back() + ";\n";
                reg_expr += function.back() + ";";
            }
            function.pop_back();
        }

        auto string_it = snippet0.find("[");

        if(string_it != std::string::npos){
            snippet1 = snippet0;
            snippet1.insert(string_it, "_reg");
        }else{
            snippet1 = snippet0 + "_reg";
        }

        term_string += "  wire " + snippet1 + ";\n";

        term_string += "  GHPC_reg reg_inst0_" + std::to_string(tmp_ctr) + "(.clk(clk), .D(" + snippet0 + "), .Q(";

        if(low_latency){
            tmp_ctr++;
        }

        function.push_back(snippet1);
        term_string += snippet1 + "));\n";

        if(!low_latency){
            term_string += "  wire " + snippet1 + "2;\n";
            term_string += "  GHPC_reg reg_inst0_2_" + std::to_string(tmp_ctr) + "(.clk(clk), .D(" + snippet1 + "), .Q(" + snippet1 + "2));\n";
            tmp_ctr++;

            function.pop_back();
            snippet1 += "2";
            function.push_back(snippet1);
        }

        if(already_registered_values0.find(reg_expr) == already_registered_values0.end()){
            input_registers.push_back(term_string);
            already_registered_values0.insert({reg_expr,snippet1});
        }else{
            function.pop_back();
            function.push_back(already_registered_values0[reg_expr]);
        }
        }
    }

    // Insert registers for inputs
    tmp_ctr = 0;
    for (auto& function : names1){
        if(!function.empty()){
        term_string.clear();
        std::string snippet0, snippet1;
        snippet0 = "r1_" + std::to_string(tmp_ctr);

        term_string += "  wire " + snippet0 + ";\n";
        term_string += "  assign " + snippet0 + " = ";

        reg_expr.clear();
        while(!function.empty()){
            if(function.size() > 1){
                term_string += function.back() + " ^ ";
                reg_expr += function.back() + " ^ ";
            }else{
                term_string += function.back() + ";\n";
                reg_expr += function.back() + ";";
            }
            function.pop_back();
        }

        auto string_it = snippet0.find("[");

        if(string_it != std::string::npos){
            snippet1 = snippet0;
            snippet1.insert(string_it, "_reg");
        }else{
            snippet1 = snippet0 + "_reg";
        }

        term_string += "  wire " + snippet1 + ";\n";

        term_string += "  GHPC_reg reg_inst1_" + std::to_string(tmp_ctr) + "(.clk(clk), .D(" + snippet0 + "), .Q(";

        if(low_latency){
            tmp_ctr++;
        }

        function.push_back(snippet1);
        term_string += snippet1 + "));\n";

        if(!low_latency){
            term_string += "  wire " + snippet1 + "2;\n";
            term_string += "  GHPC_reg reg_inst1_2_" + std::to_string(tmp_ctr) + "(.clk(clk), .D(" + snippet1 + "), .Q(" + snippet1 + "2));\n";
            tmp_ctr++;

            function.pop_back();
            snippet1 += "2";
            function.push_back(snippet1);
        }

        if(already_registered_values1.find(reg_expr) == already_registered_values1.end()){
            input_registers.push_back(term_string);
            already_registered_values1.insert({reg_expr,snippet1});
        }else{
            function.pop_back();
            function.push_back(already_registered_values1[reg_expr]);
        }
        }
    }
    }

    term_string = "\n";
    input_registers.push_back(term_string);

    auto finish_ex = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed_ex = finish_ex - start_ex;
    std::cout << "[" << elapsed_ex.count() << "] Grouping finished!" << std::endl;

    // Print module definition
    term_string.clear();
    term_string = "module " + topmodule + "_ANF #(low_latency = " + std::to_string(low_latency) + ", pipeline = " + std::to_string(pipeline) + ") (clk, r";
    module_definition.push_back(term_string);

    // Print module inputs
    for(auto gate : input_gates){
        auto string_it = model[gate].name.find("[");
        std::string snippet;

        if(string_it != std::string::npos){snippet = model[gate].name.substr(0,string_it);}else{snippet = model[gate].name;}
        if(input_list.find(snippet) != input_list.end()){input_list[snippet]++;}else{input_list.insert({snippet,1});}
    }

    for(auto input_name : input_list){
        term_string.clear();
        term_string = ", " + input_name.first + "0, " + input_name.first + "1";
        module_definition.push_back(term_string);
    }

    // Print module outputs
    for(auto gate : output_gates){
        auto string_it = model[gate].name.find("[");
        std::string snippet;

        if(string_it != std::string::npos){snippet = model[gate].name.substr(0,string_it);}else{snippet = model[gate].name;}
        if(output_list.find(snippet) != input_list.end()){output_list[snippet]++;}else{output_list.insert({snippet,1});}
    }

    for(auto output_name : output_list){
        term_string.clear();
        term_string = ", " + output_name.first + "0, " + output_name.first + "1";
        module_definition.push_back(term_string);
    }

    term_string.clear();
    term_string = ");\n  input clk;\n";
    module_definition.push_back(term_string);


    // Print input definitions
    for(auto input_name : input_list){
        if(input_name.second > 1){
            term_string.clear();
            term_string = "  input [" + std::to_string(input_name.second-1) + ":0] " + input_name.first + "0, " + input_name.first + "1;\n";
            module_definition.push_back(term_string);
        }else{
            term_string.clear();
            term_string = "  input " + input_name.first + "0, " + input_name.first + "1;\n";
            module_definition.push_back(term_string);
        }
    }

    // Print output definitions
    for(auto output_name : output_list){
        if(output_name.second > 1){
            term_string.clear();
            term_string = "  output [" + std::to_string(output_name.second-1) + ":0] " + output_name.first + "0, " + output_name.first + "1;\n";
            module_definition.push_back(term_string);
        }else{
            term_string.clear();
            term_string = "  output " + output_name.first + "0, " + output_name.first + "1;\n";
            module_definition.push_back(term_string);
        }
    }

    std::vector<std::vector<encoding_data>> computation;
    std::vector<encoding_data> equations;
    std::set<encoding_data> grp_set;

    auto start_sa = std::chrono::high_resolution_clock::now();

    // Reduce the number of outputs for each gadget
    total_area = 0;

    std::ifstream GHPC_Step1_old(LibraryPath + "ghpc/GHPC_Step1.vhd");
    if(GHPC_Step1_old.fail()){std::cout << "[ERROR] GHPC_Step1.vhd does not exist!" << std::endl;}
    std::ifstream GHPC_Gadget_old(LibraryPath + "ghpc/GHPC_Gadget.vhd");
    if(GHPC_Step1_old.fail()){std::cout << "[ERROR] GHPC_Gadget.vhd does not exist!" << std::endl;}
    std::string line;

    // Run optimization of gadget outputs
    for (size_t t = 1; t <= gadget_ctr; t++){
        std::ofstream GHPC_Step1("GHPC_Step1_" + std::to_string(t-1) + ".vhd");
        std::ofstream GHPC_Gadget("GHPC_Gadget_" + std::to_string(t-1) + ".vhd");

        GHPC_Step1_old.clear();
        GHPC_Step1_old.seekg(0);

        // Copy from the template
        while(getline(GHPC_Step1_old, line)){
            if(line.find("entity") != std::string::npos){
                break;
            }else{
                GHPC_Step1 << line << std::endl;
            }
        }

        GHPC_Step1 << "entity GHPC_Step1_" << t-1 << " is" << std::endl;

        // Copy from the template
        while(getline(GHPC_Step1_old, line)){
            if(line.find("end") != std::string::npos){
                break;
            }else{
                GHPC_Step1 << line << std::endl;
            }
        }

        GHPC_Step1 << "end GHPC_Step1_" << t-1 << ";" << std::endl << std::endl;

        while(getline(GHPC_Step1_old, line)){
            if(line.find("architecture") != std::string::npos){
                break;
            }else{
                GHPC_Step1 << line << std::endl;
            }
        }

        GHPC_Step1 << "architecture Behavioral of GHPC_Step1_" << t-1 << " is" << std::endl << std::endl;

        // Copy from the template
        while(getline(GHPC_Step1_old, line)){
            if(line.find("FuncOut(I)(0) <= in0_comb(I)(0) AND in0_comb(I)(1);") != std::string::npos){
                break;
            }else{
                GHPC_Step1 << line << std::endl;
            }
        }

        GHPC_Gadget_old.clear();
        GHPC_Gadget_old.seekg(0);

        while(getline(GHPC_Gadget_old, line)){
            if(line.find("entity") != std::string::npos){
                break;
            }else{
                GHPC_Gadget << line << std::endl;
            }
        }

        GHPC_Gadget << "entity GHPC_Gadget_" << t-1 << " is" << std::endl;

        while(getline(GHPC_Gadget_old, line)){
            if(line.find("end") != std::string::npos){
                break;
            }else{
               GHPC_Gadget << line << std::endl;
            }
        }

        GHPC_Gadget << "end GHPC_Gadget_" << t-1 << ";" << std::endl << std::endl;

        while(getline(GHPC_Gadget_old, line)){
            if(line.find("architecture") != std::string::npos){
                break;
            }else{
                GHPC_Gadget << line << std::endl;
            }
        }

        GHPC_Gadget << "architecture Behavioral of GHPC_Gadget_" << t-1 << " is" << std::endl << std::endl;

        while(getline(GHPC_Gadget_old, line)){
            if(line.find("work.GHPC_Step1") != std::string::npos){
                break;
            }else{
                GHPC_Gadget << line << std::endl;
            }
        }

        GHPC_Gadget << "    Step1_" << t-1 << "_ins: entity work.GHPC_Step1_" << t-1 << std::endl;

        while(getline(GHPC_Gadget_old, line)){
            GHPC_Gadget << line << std::endl;
        }

        tmp_ctr = 0;
        real_to_subst_mon.clear();
        subst_to_real_mon.clear();
        equations.clear();
        computation.clear();

        // Translate each monomial to a one bit encoding and backwards
        for(auto monomial : mons_set_rev){

            // Get all outputs
            if(mons_set_rev[monomial.first] == t){
                temporary_monomial = 0;
                boost::multiprecision::bit_set(temporary_monomial, tmp_ctr);

                subst_to_real_mon.insert({temporary_monomial, monomial.first});
                real_to_subst_mon.insert({monomial.first, temporary_monomial});
                tmp_ctr++;
            }
        }

        tmp_ctr = 0;

        // Prepare the data type for simulated annealing
        for(auto gate : output_gates){

            temporary_monomial = 0;
            for(auto monomial : model[gate].funcANF.m){
                if(mons_set_rev[monomial.first] == t){
                    temporary_monomial ^= real_to_subst_mon[monomial.first];
                }
            }

            if(temporary_monomial){equations.push_back(temporary_monomial);}
        }

        SimulatedAnnealing(equations, computation);

        // Find linear combinations of inputs
        tmp_mon = 0;
        tmp_ctr = 0;
        gadget_area = 0;
        gadget_inputs = 0;
        id_list.clear();

        for (auto &term : computation){
            for (auto &subterm : term){
                tmp_subterm = subterm;

                l = 0;
                while (tmp_subterm > 0){
                    // Check if a term contains a monomial
                    if(boost::multiprecision::bit_test(subterm, l)){
                        temporary_monomial = 0;
                        boost::multiprecision::bit_set(temporary_monomial, l);
                        tmp_mon |= subst_to_real_mon[temporary_monomial];
                        boost::multiprecision::bit_flip(tmp_subterm, l);
                    }

                    l++;
                }
            }
        }

        l = 0;
        while (tmp_mon > 0){
            if(boost::multiprecision::bit_test(tmp_mon, l)){
                id_list.insert(l);
                boost::multiprecision::bit_flip(tmp_mon, l);
            }
            l++;
        }

        bool check = false;
        unsigned int tmp_tmp_ctr = 0;
        for (std::set<size_t>::iterator i = id_list.begin(); i != id_list.end(); i++){
            tmp_tmp_ctr++;
            for (std::set<size_t>::iterator j = i; j != id_list.end(); j++){
                mon_set1.clear();
                mon_set2.clear();

                for (auto &term : computation){
                    for (auto &subterm : term){
                        tmp_subterm = subterm;

                        l = 0;
                        while (tmp_subterm > 0 && *i != *j){
                            // Check if a term contains a monomial
                            if(boost::multiprecision::bit_test(subterm, l)){
                                temporary_monomial = 0;
                                boost::multiprecision::bit_set(temporary_monomial, l);

                                if(boost::multiprecision::bit_test(subst_to_real_mon[temporary_monomial], *i)){
                                    mon = subst_to_real_mon[temporary_monomial];
                                    boost::multiprecision::bit_flip(mon, *i);
                                    mon_set1.insert(mon);
                                }

                                if(boost::multiprecision::bit_test(subst_to_real_mon[temporary_monomial], *j)){
                                    mon = subst_to_real_mon[temporary_monomial];
                                    boost::multiprecision::bit_flip(mon, *j);
                                    mon_set2.insert(mon);
                                }

                                boost::multiprecision::bit_flip(tmp_subterm, l);
                            }

                            l++;
                        }
                    }
                }

                if(mon_set1 == mon_set2 && !mon_set1.empty()){
                    for (auto input : input_gates){
                        if(model[input].funcANF.id == *j){
                            name2 = model[input].name;

                            // Erase all monomials with the second operand
                            for (auto &term : computation){
                                for (auto &subterm : term){
                                    tmp_subterm2 = subterm;

                                    l2 = 0;
                                    while (tmp_subterm2 > 0){
                                        // Check if a term contains a monomial
                                        if(boost::multiprecision::bit_test(subterm, l2)){
                                            temporary_monomial = 0;
                                            boost::multiprecision::bit_set(temporary_monomial, l2);

                                            if(boost::multiprecision::bit_test(subst_to_real_mon[temporary_monomial], *j)){
                                                for(auto gate : output_gates){
                                                    auto output_it = model[gate].funcANF.m.find(subst_to_real_mon[temporary_monomial]);

                                                    if(output_it != model[gate].funcANF.m.end()){
                                                        model[gate].funcANF.m.erase(output_it);
                                                    }

                                                    output_ctr++;
                                                }

                                                boost::multiprecision::bit_flip(subterm, l2);
                                            }

                                            boost::multiprecision::bit_flip(tmp_subterm2, l2);
                                        }

                                        l2++;
                                    }
                                }
                            }
                        }
                    }

                    for (auto input : input_gates){
                        if(model[input].funcANF.id == *i){
                            name3 = "n" + std::to_string(t) + "_" + std::to_string(tmp_ctr);
                            name1 = model[input].name;
                            tmp_ctr++;
                            // Modify node to substituted node
                            model[input].name = name3;
                        }
                    }

                    auto string_it0 = name1.find("[");
                    auto string_it1 = name2.find("[");

                    std::string snippet0, snippet1, snippet2, snippet3;

                    if(string_it0 != std::string::npos){
                        snippet0 = name1;
                        snippet0.insert(string_it0, "0");
                        snippet1 = name1;
                        snippet1.insert(string_it0, "1");
                    }else{
                        snippet0 = name1 + "0";
                        snippet1 = name1 + "1";
                    }

                    if(string_it1 != std::string::npos){
                        snippet2 = name2;
                        snippet2.insert(string_it1, "0");
                        snippet3 = name2;
                        snippet3.insert(string_it1, "1");
                    }else{
                        snippet2 = name2 + "0";
                        snippet3 = name2 + "1";                    }

                    term_string = "  wire " + name3 + "0," + name3 + "1;\n";
                    term_string += "  assign " + name3 + "0 = " + snippet0 + " ^ " + snippet2 + ";\n";
                    term_string += "  assign " + name3 + "1 = " + snippet1 + " ^ " + snippet3 + ";\n";
                    reduction_terms.push_back(term_string);
                    check = true;
                }
            }
        }

        if(check){
            term_string = "\n";
            reduction_terms.push_back(term_string);
        }

        // Store the set of output equations per gadget
        grp_set.clear();
        for (auto &term : computation){
            for (auto &subterm : term){grp_set.insert(subterm);}
        }

        // Translate the annealing output back to an equation
        for (auto &term : grp_set){

            l = 0;
            tmp_subterm = term;

            while (tmp_subterm > 0){

                // Check if a term contains a monomial
                if(boost::multiprecision::bit_test(tmp_subterm, l)){
                    boost::multiprecision::bit_flip(tmp_subterm, l);

                    temporary_monomial = 0;
                    boost::multiprecision::bit_set(temporary_monomial, l);
                    gadget_inputs |= subst_to_real_mon[temporary_monomial];
                }
                l++;
            }
        }

        // Compute area and randomness estimations
        boost::multiprecision::bit_set(gadget_area, hw(gadget_inputs));
        total_area += grp_set.size() * gadget_area;
        randomness_old = randomness;
        randomness += grp_set.size();
        randomness_ll_old = randomness_ll;
        randomness_ll += grp_set.size() * (unsigned long)gadget_area;

        term_string.clear();
        term_string = "  wire [" + std::to_string(grp_set.size()-1) + ":0] g" + std::to_string(t-1) + "_0, g" + std::to_string(t-1) + "_1;\n";
        term_string += "  GHPC_Gadget_" + std::to_string(t-1) + " #(.in_size('d" + std::to_string(hw(gadget_inputs)) + "), .out_size('d" + std::to_string(grp_set.size()) + "), .low_latency(low_latency), .pipeline(pipeline))";
        term_string += " GHPC_Gadget_" + std::to_string(t-1) + "_inst(.in0({";

        // Print gadget inputs
        l = 0;
        mon = gadget_inputs;
        while(mon > 0){
            if(boost::multiprecision::bit_test(mon, l)){
                boost::multiprecision::bit_flip(mon, l);

                for (auto &input : input_gates){
                    if(model[input].funcANF.id == l){
                        auto string_it = model[input].name.find("[");
                        std::string snippet;

                        if(string_it != std::string::npos){
                            snippet = model[input].name;
                            snippet.insert(string_it, "0");
                        }else{
                            snippet = model[input].name + "0";
                        }


                        term_string += snippet;

                        if(mon > 0){term_string += ",";}else{term_string += "}), ";}
                    }
                }
            }

            l++;
        }

        term_string += ".in1({";

        l = 0;
        mon = gadget_inputs;
        while(mon > 0){
            if(boost::multiprecision::bit_test(mon, l)){
                boost::multiprecision::bit_flip(mon, l);

                for (auto &input : input_gates){
                    if(model[input].funcANF.id == l){
                        auto string_it = model[input].name.find("[");
                        std::string snippet;

                        if(string_it != std::string::npos){
                            snippet = model[input].name;
                            snippet.insert(string_it, "1");
                        }else{
                            snippet = model[input].name + "1";
                        }


                        term_string += snippet;

                        if(mon > 0){term_string += ",";}else{term_string += "}), ";}
                    }
                }
            }

            l++;
        }

        if(low_latency){
            term_string += ".r(r[" + std::to_string(randomness_ll-1) + ":" + std::to_string(randomness_ll_old) + "]), .clk(clk), .out0(g" + std::to_string(t-1) + "_0), .out1(g" + std::to_string(t-1) + "_1));\n";
        }else{
            term_string += ".r(r[" + std::to_string(randomness-1) + ":" + std::to_string(randomness_old) + "]), .clk(clk), .out0(g" + std::to_string(t-1) + "_0), .out1(g" + std::to_string(t-1) + "_1));\n";
        }

        // Rename gadget inputs
        l = 0;
        tmp_ctr = hw(gadget_inputs) - 1;
        while(gadget_inputs > 0){
            if(boost::multiprecision::bit_test(gadget_inputs, l)){
                boost::multiprecision::bit_flip(gadget_inputs, l);

                for (auto &input : input_gates){
                    if(model[input].funcANF.id == l){
                        model[input].funcANF.used = tmp_ctr;
                        tmp_ctr--;
                    }
                }
            }

            l++;
        }

        // Print gadgets
        tmp_ctr = 0;
        unsigned int tmp_ctr2 = 0;

        for (auto &term : grp_set){
            GHPC_Step1 << "            FuncOut(I)(" << tmp_ctr << ") <= (";

            // Translate the annealing output back to an equation
            l = 0;
            tmp_subterm = term;

            while (tmp_subterm > 0){

                // Check if a term contains a monomial
                if(boost::multiprecision::bit_test(tmp_subterm, l)){
                    boost::multiprecision::bit_flip(tmp_subterm, l);

                    temporary_monomial = 0;
                    boost::multiprecision::bit_set(temporary_monomial, l);
                    gadget_inputs |= subst_to_real_mon[temporary_monomial];

                    // Translate the monomial back to input values
                    l2 = 0;
                    mon = subst_to_real_mon[temporary_monomial];

                    while (mon > 0){
                        if(boost::multiprecision::bit_test(mon, l2)){
                            boost::multiprecision::bit_flip(mon, l2);

                            // Iterate over all inputs to find the correct id
                            for (auto &input : input_gates){
                                if(model[input].funcANF.id == l2){
                                    GHPC_Step1 << "in0_comb(I)(" << model[input].funcANF.used << ")";

                                    if(mon > 0){GHPC_Step1 << " and ";}
                                }
                            }
                        }

                        l2++;
                    }

                    if(tmp_subterm > 0){GHPC_Step1 << ") xor (";}
                }

                l++;
            }

            GHPC_Step1 << ");" << std::endl;
            tmp_ctr++;
        }

        tmp_ctr = 0;

        std::string name = "s" + std::to_string(t-1) + "_0[" + std::to_string(tmp_ctr) + "]";
        term_string += "  wire [" + std::to_string(computation.size()-1) + ":0] s" + std::to_string(t-1) + "_0, s" + std::to_string(t-1) + "_1;\n";

        // Print sums of terms within one gadget
        for (auto &term : computation){
            name = "s" + std::to_string(t-1) + "_0[" + std::to_string(tmp_ctr) + "]";
            term_string += "  assign " + name + " = ";

            temporary_monomial = 0;

            for (auto &subterm : term){
                unsigned int subterm_ctr = 0;
                temporary_monomial ^= subterm;

                for(auto &subterm2 : grp_set){
                    if(subterm == subterm2){
                        term_string += "g" + std::to_string(t-1) + "_0[" + std::to_string(subterm_ctr) + "]";

                        if(&subterm != &term.back()){
                            term_string += " ^ ";
                        }

                        break;
                    }
                    subterm_ctr++;
                }
            }

            term_string += ";\n";

            output_ctr = 0;
            for(auto gate : output_gates){
                tmp_mon = 0;

                for(auto monomial : model[gate].funcANF.m){
                    if(mons_set_rev[monomial.first] == t){
                        tmp_mon ^= real_to_subst_mon[monomial.first];
                    }
                }

                if(temporary_monomial == tmp_mon){
                    names0[output_ctr].push_back(name);
                }

                output_ctr++;
            }

            name = "s" + std::to_string(t-1) + "_1[" + std::to_string(tmp_ctr) + "]";

            term_string += "  assign " + name + " = ";

            temporary_monomial = 0;

            for (auto &subterm : term){
                unsigned int subterm_ctr = 0;
                temporary_monomial ^= subterm;

                for(auto &subterm2 : grp_set){
                    if(subterm == subterm2){
                        term_string += "g" + std::to_string(t-1) + "_1[" + std::to_string(subterm_ctr) + "]";

                        if(&subterm != &term.back()){
                            term_string += " ^ ";
                        }

                        break;
                    }
                    subterm_ctr++;
                }
            }

            term_string += ";\n";


            output_ctr = 0;
            for(auto gate : output_gates){
                tmp_mon = 0;

                for(auto monomial : model[gate].funcANF.m){
                    if(mons_set_rev[monomial.first] == t){
                        tmp_mon ^= real_to_subst_mon[monomial.first];
                    }
                }

                if(temporary_monomial == tmp_mon){
                    names1[output_ctr].push_back(name);
                }

                output_ctr++;
            }
            tmp_ctr++;
        }

        // Copy from the template
        while(getline(GHPC_Step1_old, line)){
            GHPC_Step1 << line << std::endl;
        }

        GHPC_Step1.close();

        std::ifstream GHPC_Step1_new("GHPC_Step1_" + std::to_string(t-1) + ".vhd");

        bool write_step1 = false;
        while(getline(GHPC_Step1_new, line)){
            if(line.find("library IEEE;") != std::string::npos){
                write_step1 = true;
            }

            if(write_step1){
                netlist2 << line << std::endl;
            }
        }

        GHPC_Step1_new.close();
        GHPC_Gadget.close();

        std::ifstream GHPC_Gadget_new("GHPC_Gadget_" + std::to_string(t-1) + ".vhd");

        bool write_gadget = false;
        while(getline(GHPC_Gadget_new, line)){
            if(line.find("library IEEE;") != std::string::npos){
                write_gadget = true;
            }

            if(write_gadget){
                netlist3 << line << std::endl;
            }
        }

        GHPC_Gadget_new.close();
        std::string deleted_file;
        deleted_file = "GHPC_Step1_" + std::to_string(t-1) + ".vhd";
        std::remove(deleted_file.c_str());

        deleted_file = "GHPC_Gadget_" + std::to_string(t-1) + ".vhd";
        std::remove(deleted_file.c_str());

        term_string += "\n";
        gadget_definition.push_back(term_string);
    }

    GHPC_Step1_old.close();
    GHPC_Gadget_old.close();

    //std::string copy_file;
    //copy_file = directory_path + "/" + topmodule + "_GHPC_AND_reg.vhd";
    //std::filesystem::copy("cell/ghpc/GHPC_AND_reg.vhd", copy_file);

    //copy_file = directory_path + "/" + topmodule + "_GHPC_pkg.vhd";
    //std::filesystem::copy("cell/ghpc/GHPC_pkg.vhd", copy_file);

    //copy_file = directory_path + "/" + topmodule + "_GHPC_Step2.vhd";
    //std::filesystem::copy("cell/ghpc/GHPC_Step2.vhd", copy_file);

    //copy_file = directory_path + "/" + topmodule + "_GHPC_XORall_xor_reg.vhd";
    //std::filesystem::copy("cell/ghpc/GHPC_XORall_xor_reg.vhd", copy_file);

    //copy_file = directory_path + "/" + topmodule + "_GHPC_reg.vhd";
    //std::filesystem::copy("cell/ghpc/GHPC_reg.vhd", copy_file);

    /*std::ifstream GHPC_AND_reg("cell/ghpc/GHPC_AND_reg.vhd");
    if(GHPC_AND_reg.fail()){std::cout << "[ERROR] GHPC_AND_reg.vhd does not exist!" << std::endl;}

    line_ctr = 0;
    while(getline(GHPC_AND_reg, line)){
        if(line_ctr > 16){
            netlist2 << line << std::endl;
        }
        line_ctr++;
    }
    GHPC_AND_reg.close();

    std::ifstream GHPC_pkg("cell/ghpc/GHPC_pkg.vhd");
    if(GHPC_pkg.fail()){std::cout << "[ERROR] GHPC_pkg.vhd does not exist!" << std::endl;}
    line_ctr = 0;
    while(getline(GHPC_pkg, line)){
        if(line_ctr > 16){
            netlist2 << line << std::endl;
        }
        line_ctr++;
    }
    GHPC_pkg.close();

    std::ifstream GHPC_Step2("cell/ghpc/GHPC_Step2.vhd");
    if(GHPC_Step2.fail()){std::cout << "[ERROR] GHPC_Step2.vhd does not exist!" << std::endl;}
    line_ctr = 0;
    while(getline(GHPC_Step2, line)){
        if(line_ctr > 16){
            netlist2 << line << std::endl;
        }
        line_ctr++;
    }
    GHPC_Step2.close();

    std::ifstream GHPC_XOR("cell/ghpc/GHPC_XORall_xor_reg.vhd");
    if(GHPC_XOR.fail()){std::cout << "[ERROR] GHPC_XORall_xor_reg.vhd does not exist!" << std::endl;}
    line_ctr = 0;
    while(getline(GHPC_XOR, line)){
        if(line_ctr > 16){
            netlist2 << line << std::endl;
        }
        line_ctr++;
    }
    GHPC_XOR.close();

    std::ifstream GHPC_reg("cell/ghpc/GHPC_reg.vhd");
    if(GHPC_reg.fail()){std::cout << "[ERROR] GHPC_reg.vhd does not exist!" << std::endl;}
    line_ctr = 0;
    while(getline(GHPC_reg, line)){
        if(line_ctr > 12){
            netlist2 << line << std::endl;
        }
        line_ctr++;
    }
    GHPC_reg.close();*/

    auto finish_sa = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed_sa = finish_sa - start_sa;
    std::cout << "[" << elapsed_sa.count() << "] Simulated annealing finished!" << std::endl;

    std::cout << "Done! " << "Randomness (GHPC): " << randomness << " bit, Randomness (GHPC_ll): " << randomness_ll << " bit, Area estimation (#o * 2^#i): " << total_area << std::endl;

    if(low_latency){
        term_string.clear();
        term_string = "  input [" + std::to_string(randomness_ll - 1) + ":0] r;\n\n";
        module_definition.push_back(term_string);
    }else{
        term_string.clear();
        term_string = "  input [" + std::to_string(randomness - 1) + ":0] r;\n\n";
        module_definition.push_back(term_string);
    }

    for(auto term : module_definition){
        netlist << term;
    }

    for(auto term : input_registers){
        netlist << term;
    }

    for(auto term : reduction_terms){
        netlist << term;
    }

    for(auto term : gadget_definition){
        netlist << term;
    }

    // Print final output
    output_ctr = 0;
    for(auto gate : output_gates){
        auto string_it = model[gate].name.find("[");
        std::string snippet;

        if(string_it != std::string::npos){
            snippet = model[gate].name;
            snippet.insert(string_it, "0");
        }else{
            snippet = model[gate].name + "0";
        }

        netlist << "  assign " << snippet << " = 1'b" << model[gate].funcANF.parity;

        for (auto term : names0[output_ctr]){
            netlist << " ^ " << term;
        }
        output_ctr++;
        netlist << ";" << std::endl;
    }

    output_ctr = 0;
    for(auto gate : output_gates){
        auto string_it = model[gate].name.find("[");
        std::string snippet;

        if(string_it != std::string::npos){
            snippet = model[gate].name;
            snippet.insert(string_it, "1");
        }else{
            snippet = model[gate].name + "1";
        }

        netlist << "  assign " << snippet << " = 1'b0";

        for (auto term : names1[output_ctr]){
            netlist << " ^ " << term;
        }
        output_ctr++;
        netlist << ";" << std::endl;
    }

    netlist << "endmodule" << std::endl;

    // Close file
    netlist.close();

    // Clear circuit model
    model.clear();
}

int convert(std::string filepath, std::string scheme, bool low_latency, bool pipeline, std::string LibraryPath){
    /* Read filename (and topmodule for verilog) */
    std::string instructions, topmodule;

    instructions = filepath;
    topmodule = filepath.substr(filepath.find_last_of("/") + 1, filepath.length() - filepath.find_last_of("/") - 4);
    std::string verilog = instructions.substr(0, instructions.size()-3) + "_" + std::string(scheme) + ".v";

    /* ========================================================================== */

    if (scheme == "BDDsylvan") convertBDD(instructions, topmodule, verilog);
    if (scheme == "BDDcudd") convertCUDD(instructions, topmodule, verilog);
    if (scheme == "AIG") convertAIG(instructions, topmodule, verilog);
    if (scheme == "ANF") convertANF(instructions, topmodule, verilog, low_latency, pipeline, LibraryPath);

	return 0;
}




