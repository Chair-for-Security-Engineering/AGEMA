/*
 * -----------------------------------------------------------------
 * COMPANY : Ruhr University Bochum
 * AUTHOR  : Pascal Sasdrich (pascal.sasdrich@rub.de) & Nicolai M�ller (nicolai.mueller@rub.de)
 * DOCUMENT: https://eprint.iacr.org/2021/569/
 * -----------------------------------------------------------------
 *
 * Copyright (c) 2021, David Knichel, Amir Moradi, Nicolai M�ller, Pascal Sasdrich
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

/* Setup Impeccable Circuits II */
#include "ImpeccableCircuitsII/design.hpp"

#include <chrono>
#include <tuple>

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

    std::string directory_path;

    if (sourcePath.find_last_of("/") != string::npos)
        directory_path = sourcePath.substr(0, sourcePath.find_last_of("/")) + "/";
    else
        directory_path = "";

    // Output file stream to write verilog circuit
    destinationPath = directory_path + topmodule + "_ANF.v";
    std::ofstream netlist(destinationPath);

    std::string destinationPath2, destinationPath3;
    destinationPath2 = directory_path + topmodule + "_GHPC_Step1.vhd";
    destinationPath3 = directory_path + topmodule + "_GHPC_Gadget.vhd";

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

ImpeccableCircuitsII::Module BuildTopmodule(std::vector<ImpeccableCircuitsII::Module>& Module, std::string ModuleName){
    ImpeccableCircuitsII::Module Topmodule;
    std::map<std::string, int> TopmoduleOutputsWithIndices;
    std::vector<std::string> AlreadyComputedOutputs;

    Topmodule.ModuleName = ModuleName;
    Topmodule.InstanceName = Topmodule.ModuleName + "_inst";

    for (size_t OutputIndex = 0; OutputIndex < Module.size(); OutputIndex++){   
        AddSignals(Module.at(OutputIndex).Inputs, Topmodule.Inputs, Topmodule.Inputs, Topmodule.Outputs);
        AddSignals(Module.at(OutputIndex).Outputs, Topmodule.Outputs, Topmodule.Outputs, Topmodule.Outputs);

        if (std::find(AlreadyComputedOutputs.begin(), AlreadyComputedOutputs.end(), Module.at(OutputIndex).Outputs.back().GetName()) == AlreadyComputedOutputs.end()){
            Topmodule.Instructions.push_back(Module.at(OutputIndex).PrintInstance());
            AlreadyComputedOutputs.push_back(Module.at(OutputIndex).Outputs.back().GetName());
        }
    }   

    return Topmodule; 
}

void BuildMainFile(std::string SourcePath, std::string Topmodule, std::string AttributeReportFileName, ImpeccableCircuitsII::Design& Design, CircuitStruct* Circuit, ImpeccableCircuitsII::ErrorCorrectingCode& Code, bool Comments){
    int InputIndex, OutputIndex;

    // Output file stream to write verilog circuit
    std::string DirectoryPath = SourcePath.substr(0, SourcePath.find_last_of("/"));
    std::string DestinationPath = DirectoryPath + "/" + Topmodule + "_Top.v";
    std::cout << "Store: " << DestinationPath << std::endl;
    std::ofstream Netlist(DestinationPath);  

    // Generate topmodule
    ImpeccableCircuitsII::Module Mainmodule;
    Mainmodule.ModuleName = Topmodule + "_Top";

    // Add IO ports
    for (InputIndex = 0; InputIndex < Circuit->NumberOfInputs; InputIndex++){
        Mainmodule.Inputs.push_back((std::string)Circuit->Signals[Circuit->Inputs[InputIndex]]->Name);
        Mainmodule.Inputs.back().Annotation = (std::string)Circuit->Signals[Circuit->Inputs[InputIndex]]->Attribute;
        Mainmodule.Inputs.back().PrimaryInput = true;
    }    

    for (OutputIndex = 0; OutputIndex < Circuit->NumberOfOutputs; OutputIndex++){
        Mainmodule.Outputs.push_back((std::string)Circuit->Signals[Circuit->Outputs[OutputIndex]]->Name);
        Mainmodule.Outputs.back().PrimaryOutput = true;
    }   

    // Add intermediate signals
    if (Design.Decomposed){
        AddSignals(Design.InF.Inputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
        AddSignals(Design.InF.Outputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    }

    AddSignals(Design.Fx.Inputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.Fx.Outputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.R1_ind.Inputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.R1_ind.Outputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.R2_ind.Inputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.R2_ind.Outputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.Reg1.Inputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.Reg1.Outputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.Reg2.Inputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);
    AddSignals(Design.Reg2.Outputs, Mainmodule.Inputs, Mainmodule.Intermediates, Mainmodule.Outputs);    

    // Add instructions
    if (Design.Decomposed){
        Mainmodule.Instructions.push_back(Design.InF.PrintInstance());
    }

    Mainmodule.Instructions.push_back(Design.Fx.PrintInstance());
    Mainmodule.Instructions.push_back(Design.R1_ind.PrintInstance());
    Mainmodule.Instructions.push_back(Design.R2_ind.PrintInstance());
    Mainmodule.Instructions.push_back(Design.Reg1.PrintInstance());
    Mainmodule.Instructions.push_back(Design.Reg2.PrintInstance());

    std::map<std::string, unsigned int> ShareDomains;
    ShareDomains = ImpeccableCircuitsII::GetAttributes(AttributeReportFileName);

    for (OutputIndex = 0; OutputIndex < (int)Mainmodule.Outputs.size(); OutputIndex++){
        if (ShareDomains.count(Mainmodule.Outputs.at(OutputIndex).GetName())){
            Mainmodule.Outputs.at(OutputIndex).share_domain = ShareDomains.at(Mainmodule.Outputs.at(OutputIndex).GetName());
        }else{
            Mainmodule.Outputs.at(OutputIndex).share_domain = 0;
        }
    }
    
    // Build muxtree for done signal
    Design.Muxtree.ModuleName = "multiplexer";
    Design.Muxtree.InstanceName = "multiplexer_inst";

    std::string Name, Instr;
    Instr = Design.Muxtree.ModuleName + " #(.WIDTH(" + std::to_string(Circuit->NumberOfOutputs) + ")) " + Design.Muxtree.InstanceName + "(.s({";

    // Find done signal name
    std::string DoneName = "no_done_signal_found", Attr;

    for (OutputIndex = 0; OutputIndex < Circuit->NumberOfOutputs; OutputIndex++){
        Attr = Circuit->Signals[Circuit->Outputs[OutputIndex]]->Attribute;

        if (Attr == "control"){
            DoneName = Circuit->Signals[Circuit->Outputs[OutputIndex]]->Name;
            break;
        }
    }

    ImpeccableCircuitsII::Signal PrimaryOutputSignal;

    if (DoneName == "no_done_signal_found"){
        std::cout << "WARNING: No done signal found!" << std::endl;

        // Wire all outputs to primary outputs
        for (OutputIndex = 0; OutputIndex < Circuit->NumberOfOutputs; OutputIndex++){
            PrimaryOutputSignal = Mainmodule.Outputs.at(OutputIndex);
            PrimaryOutputSignal.Appendix = "_Final";

            Instr = "assign " + Mainmodule.Outputs.at(OutputIndex).GetName() +  " = " + PrimaryOutputSignal.GetName() + ";";
            Mainmodule.Instructions.push_back(Instr);
        }

    }else{
        for (size_t i = 0; i < Code.ParityWidth; i++){
            Name = DoneName;
            Name += "_Final[" + std::to_string(i) + "]";
            Instr += Name + ", ";
            Design.Muxtree.Inputs.push_back(Name);
        }
        
        Name = DoneName;
        Name += "_Final";
        Design.Muxtree.Inputs.push_back(Name);
        Design.Muxtree.Outputs.push_back(DoneName);
        Instr += Name + "}), .d({";
        Name = ".q({";

        for (OutputIndex = 0; OutputIndex < Circuit->NumberOfOutputs; OutputIndex++){
            PrimaryOutputSignal = Mainmodule.Outputs.at(OutputIndex);
            PrimaryOutputSignal.Appendix = "_Final";
            
            if (PrimaryOutputSignal.Index == -1){
                PrimaryOutputSignal.Index = 0;
            }

            if (OutputIndex == Circuit->NumberOfOutputs - 1){ 
                Name += Mainmodule.Outputs.at(OutputIndex).GetName() + "}));";
                Instr += PrimaryOutputSignal.GetName() + "}), ";
            }else{
                Name += Mainmodule.Outputs.at(OutputIndex).GetName() + ", ";
                Instr += PrimaryOutputSignal.GetName() + ", ";
            }
        }

        Instr += Name;
        Design.Muxtree.Instructions.push_back(Instr);

        // Assign final multiplexer(s)
        Mainmodule.Instructions.push_back(Design.Muxtree.Instructions.at(0));
    }

    Mainmodule.PrintModule(Netlist, Comments, false);
    ImpeccableCircuitsII::PrintRegister(Netlist);
    ImpeccableCircuitsII::PrintMultiplexer(Netlist, Mainmodule.Outputs, Design.F.size());
    ImpeccableCircuitsII::PrintMultiplexerTree(Netlist, Design.F.size(), Design.RedundandDoneSignal);
    Netlist.close();
}

std::vector<ImpeccableCircuitsII::Module> PrepareRedundantLayer(unsigned int MessageSize, std::vector<ImpeccableCircuitsII::Signal> Data, std::vector<ImpeccableCircuitsII::Signal> Redundancy, std::vector<ImpeccableCircuitsII::Module>& Layer, std::string InputAppendix, std::string DirectInputAppendix, std::string OutputAppendix){
    std::vector<ImpeccableCircuitsII::Module> Result;
    ImpeccableCircuitsII::Module Module;
    unsigned int InputIndex, MessageIndex, RedundancyIndex, RedundancySize = Layer.size(), Counter = 0;
    std::string Instruction, Search, Replace;

    for (MessageIndex = 0; MessageIndex < Data.size(); MessageIndex+= MessageSize){
        for (RedundancyIndex = 0; RedundancyIndex < RedundancySize; RedundancyIndex++){
            if (Redundancy.at((MessageIndex/MessageSize) * RedundancySize + RedundancyIndex).GetName() != "1'b0"){

                Result.push_back(Module);
                Result.back().SetModuleAndInstanceName(Layer.at(RedundancyIndex).ModuleName, Layer.at(RedundancyIndex).InstanceName, OutputAppendix, Counter);
                Counter++;
                    
                // Set the module inputs
                for (InputIndex = 0; InputIndex < Layer.at(RedundancyIndex).Inputs.size(); InputIndex++){
                    Result.back().Inputs.push_back(Data.at(MessageIndex + Layer.at(RedundancyIndex).Inputs.at(InputIndex).Index));
                    Result.back().Inputs.back().PrimaryOutput = false;

                    if (Result.back().Inputs.back().GetName() != "1'b0"){
                        if (Result.back().Inputs.back().Linear){
                            Result.back().Inputs.back().Appendix = DirectInputAppendix;
                        }else{
                            Result.back().Inputs.back().Appendix = InputAppendix;
                        }
                    }
                }

                // Set the module output
                Result.back().Outputs.push_back(Redundancy.at((MessageIndex/MessageSize) * RedundancySize + RedundancyIndex));
                Result.back().Outputs.back().Appendix = OutputAppendix;

                // Set instruction
                Instruction = Layer.at(RedundancyIndex).Instructions.at(0);

                for (InputIndex = 0; InputIndex < Result.back().Inputs.size(); InputIndex++){
                    Instruction = ImpeccableCircuitsII::ReplaceString(Instruction, Layer.at(RedundancyIndex).Inputs.at(InputIndex).GetName(), Result.back().Inputs.at(InputIndex).GetName());
                }  
                
                Instruction = ImpeccableCircuitsII::ReplaceString(Instruction, Layer.at(RedundancyIndex).Outputs.back().GetName(), Result.back().Outputs.back().GetName());
                Result.back().Instructions.emplace_back(Instruction);
            }  
        }         
    }

    return Result;
}

std::vector<ImpeccableCircuitsII::Module> PrepareRoundLayer(std::vector<ImpeccableCircuitsII::Module>& Layer, std::string InputAppendix, std::string DirectInputAppendix, std::string OutputAppendix){
    std::vector<ImpeccableCircuitsII::Module> Result(Layer.size());
    unsigned int InputIndex, OutputIndex, TmpIndex;
    std::string Search;

    for (OutputIndex = 0; OutputIndex < Layer.size(); OutputIndex++){
        Result.at(OutputIndex).SetModuleAndInstanceName(Layer.at(OutputIndex).ModuleName, Layer.at(OutputIndex).InstanceName, OutputAppendix, OutputIndex);

        // Set module output
        Result.at(OutputIndex).Outputs.push_back(Layer.at(OutputIndex).Outputs.at(0));
        Result.at(OutputIndex).Outputs.at(0).Appendix = OutputAppendix;

        // Add inputs while appending feedback signals
        for (InputIndex = 0; InputIndex < Layer.at(OutputIndex).Inputs.size(); InputIndex++){
            Result.at(OutputIndex).Inputs.push_back(Layer.at(OutputIndex).Inputs.at(InputIndex));

            if (!Layer.at(OutputIndex).Inputs.at(InputIndex).PrimaryInput){
                if (Layer.at(OutputIndex).Inputs.at(InputIndex).Linear){
                    Result.at(OutputIndex).Inputs.at(InputIndex).Appendix = DirectInputAppendix;
                }else{
                    Result.at(OutputIndex).Inputs.at(InputIndex).Appendix = InputAppendix;
                }
            }
        }

        // Add intermediates
        for (InputIndex = 0; InputIndex < Layer.at(OutputIndex).Intermediates.size(); InputIndex++){
            Result.at(OutputIndex).Intermediates.push_back(Layer.at(OutputIndex).Intermediates.at(InputIndex));
        }

        // Set instructions
        Result.at(OutputIndex).Instructions = Layer.at(OutputIndex).Instructions;

        if (Layer.at(OutputIndex).Inputs != Layer.at(OutputIndex).Outputs){
            ImpeccableCircuitsII::ReplaceSignalNames(Layer.at(OutputIndex).Inputs, Layer.at(OutputIndex).Intermediates, Layer.at(OutputIndex).Outputs, Result.at(OutputIndex).Instructions, "x!?", "t!?", "y!?");
        }else{
            Result.at(OutputIndex).Instructions.at(0) = ImpeccableCircuitsII::ReplaceString(Result.at(OutputIndex).Instructions.at(0), "x", "x!?");
            Result.at(OutputIndex).Instructions.at(0) = ImpeccableCircuitsII::ReplaceString(Result.at(OutputIndex).Instructions.at(0), "y", "y!?");
        }

        for (InputIndex = 0; InputIndex < Layer.at(OutputIndex).Instructions.size(); InputIndex++){
            Result.at(OutputIndex).Instructions.at(InputIndex) = ImpeccableCircuitsII::ReplaceString(Result.at(OutputIndex).Instructions.at(InputIndex), "y!?", Result.at(OutputIndex).Outputs.at(0).GetName());

            if (Result.at(OutputIndex).Inputs.size() == 1){
                Search = "x!?";
                Result.at(OutputIndex).Instructions.at(InputIndex) = ImpeccableCircuitsII::ReplaceString(Result.at(OutputIndex).Instructions.at(InputIndex), Search, Result.at(OutputIndex).Inputs.back().GetName());
            }else{
                for (TmpIndex = 0; TmpIndex < Result.at(OutputIndex).Inputs.size(); TmpIndex++){
                    Search = "x!?[" + std::to_string(TmpIndex) + "]";
                    Result.at(OutputIndex).Instructions.at(InputIndex) = ImpeccableCircuitsII::ReplaceString(Result.at(OutputIndex).Instructions.at(InputIndex), Search, Result.at(OutputIndex).Inputs.at(TmpIndex).GetName());
                }
            }
            
            if (Result.at(OutputIndex).Intermediates.size() == 1){
                Search = "t!?";
                Result.at(OutputIndex).Instructions.at(InputIndex) = ImpeccableCircuitsII::ReplaceString(Result.at(OutputIndex).Instructions.at(InputIndex), Search, Result.at(OutputIndex).Intermediates.back().GetName());
            }else{
                for (TmpIndex = 0; TmpIndex < Result.at(OutputIndex).Intermediates.size(); TmpIndex++){
                    Search = "t!?[" + std::to_string(TmpIndex) + "]";
                    Result.at(OutputIndex).Instructions.at(InputIndex) = ImpeccableCircuitsII::ReplaceString(Result.at(OutputIndex).Instructions.at(InputIndex), Search, Result.at(OutputIndex).Intermediates.at(TmpIndex).GetName());
                }
            }
        } 
    }

    return Result;
}

std::vector<ImpeccableCircuitsII::Module> PrepareXorLayer(std::vector<ImpeccableCircuitsII::Signal> Signals, std::string InputAppendix1, std::string InputAppendix2, std::string OutputAppendix){
    unsigned int OutputIndex, SignalIndex = 0, NumberOfOutputs = 0;
    std::string Instruction;
    
    for (unsigned int OutputIndex = 0; OutputIndex < Signals.size(); OutputIndex++){
        if ((Signals.at(OutputIndex).GetName() != "1'b0") && (Signals.at(OutputIndex).GetName() != "1'b1")){
            NumberOfOutputs++;
        }
    }
    
    std::vector<ImpeccableCircuitsII::Module> Result(NumberOfOutputs);

    for (OutputIndex = 0; OutputIndex < Signals.size(); OutputIndex++){
        if ((Signals.at(OutputIndex).GetName() != "1'b0") && (Signals.at(OutputIndex).GetName() != "1'b1")){
            Result.at(SignalIndex).SetModuleAndInstanceName("OurXor", "OurXor_inst", OutputAppendix, OutputIndex);
            Result.at(SignalIndex).Inputs.push_back(Signals.at(OutputIndex));
            Result.at(SignalIndex).Inputs.at(0).Appendix = InputAppendix1;
            Result.at(SignalIndex).Inputs.at(0).PrimaryOutput = false;
            Result.at(SignalIndex).Inputs.push_back(Signals.at(OutputIndex));
            Result.at(SignalIndex).Inputs.at(1).Appendix = InputAppendix2;        
            Result.at(SignalIndex).Inputs.at(1).PrimaryOutput = false;
            Result.at(SignalIndex).Outputs.push_back(Signals.at(OutputIndex));
            Result.at(SignalIndex).Outputs.at(0).PrimaryOutput = Signals.at(OutputIndex).PrimaryOutput;
            Result.at(SignalIndex).Outputs.at(0).Appendix = OutputAppendix;
            
            // Set instruction
            Instruction = "assign " + Result.at(SignalIndex).Outputs.at(0).GetName() + " = " + Result.at(SignalIndex).Inputs.at(0).GetName() + " ^ " + Result.at(SignalIndex).Inputs.at(1).GetName() + ";";
            Result.at(SignalIndex).Instructions.emplace_back(Instruction);   
            SignalIndex++;
        }
    }

    return Result;
}

void GenerateRegisterModule(std::string SourcePath, std::string Topmodule, std::string AttributeReportFileName, ImpeccableCircuitsII::ErrorCorrectingCode& Code, ImpeccableCircuitsII::Signal& Clock, ImpeccableCircuitsII::Design& Design, std::vector<ImpeccableCircuitsII::Signal>& DataStateBeforeReg, std::vector<ImpeccableCircuitsII::Signal>& RedundancyStateBeforeReg, std::vector<ImpeccableCircuitsII::Signal>& DataStateAfterReg, std::vector<ImpeccableCircuitsII::Signal>& RedundancyStateAfterReg, std::vector<ImpeccableCircuitsII::Signal>& DataPrimaryState, std::vector<ImpeccableCircuitsII::Signal>& RedundancyPrimaryState, std::string DataModuleName, std::string DataInputAppendix, std::string DataOutputAppendix, std::string RedundancyModuleName, std::string RedundancyInputAppendix, std::string RedundancyOutputAppendix){  
    unsigned int BitIndex, MessageIndex, RegisterIndex, ShareDomain;
    std::string RegisterInputName, RegisterOutputName, Instruction, Attribute;
    std::map<unsigned int, std::vector<std::string>> SharedRegisterInputs, SharedRegisterOutputs;

    std::map<std::string, unsigned int> ShareDomains;
    ShareDomains = ImpeccableCircuitsII::GetAttributes(AttributeReportFileName);

    // We sort the signals based on (attribute, share domain, depth, reg/comb, linear)
    std::map<std::tuple<std::string, unsigned int, int, bool, unsigned int>, std::vector<ImpeccableCircuitsII::Signal>> SignalsBeforeReg, SignalsAfterReg, PrimarySignals;
    std::vector<ImpeccableCircuitsII::Signal> PrimaryInputSignals; 
    bool IsReg;
    int Depth;

    // Create two modules for the register stages
    // Reg1 stores the synchronized data state while Reg2 stores the synchronized redundant state
    Design.Reg1.ModuleName = DataModuleName;
    Design.Reg2.ModuleName = RedundancyModuleName;
    Design.Reg1.InstanceName = Design.Reg1.ModuleName + "_inst";
    Design.Reg2.InstanceName = Design.Reg2.ModuleName + "_inst";
    Design.Reg1.Inputs.push_back(Clock);
    Design.Reg2.Inputs.push_back(Clock);

    for (RegisterIndex = 0; RegisterIndex < Design.R.size(); RegisterIndex++){
        for (BitIndex = 0; BitIndex < Design.R.at(RegisterIndex).Inputs.size(); BitIndex++){
            if (Design.R.at(RegisterIndex).Inputs.at(BitIndex).PrimaryInput){
                PrimaryInputSignals.push_back(Design.R.at(RegisterIndex).Inputs.at(BitIndex));
            }
        }
    }

    std::sort(PrimaryInputSignals.begin(), PrimaryInputSignals.end(), [](ImpeccableCircuitsII::Signal& a, ImpeccableCircuitsII::Signal& b) {
        if (a.GetName().length() == b.GetName().length()){
            return a.GetName() < b.GetName();
        }else{
            return a.GetName().length() < b.GetName().length();
        }
    });    

    PrimaryInputSignals.erase(std::unique(PrimaryInputSignals.begin(), PrimaryInputSignals.end(), [] (ImpeccableCircuitsII::Signal &lhs, ImpeccableCircuitsII::Signal &rhs) {return (lhs.GetName() == rhs.GetName());}), PrimaryInputSignals.end());

    for (RegisterIndex = 0; RegisterIndex < PrimaryInputSignals.size(); RegisterIndex++){
        Attribute = PrimaryInputSignals.at(RegisterIndex).Annotation;
        Depth = PrimaryInputSignals.at(RegisterIndex).Depth;

        if (ShareDomains.count(PrimaryInputSignals.at(RegisterIndex).GetName())){
            ShareDomain = ShareDomains.at(PrimaryInputSignals.at(RegisterIndex).GetName());
        }else if (ShareDomains.count(PrimaryInputSignals.at(RegisterIndex).GetName())){
            ShareDomain = ShareDomains.at(PrimaryInputSignals.at(RegisterIndex).GetName());
        }else{
            ShareDomain = 0;
        }

        PrimarySignals[std::make_tuple(Attribute, ShareDomain, Depth, false, false)].push_back(PrimaryInputSignals.at(RegisterIndex));
    }

    for (auto& Signals: PrimarySignals){
        for (MessageIndex = 0; MessageIndex < Signals.second.size(); MessageIndex++){
            Signals.second.at(MessageIndex).share_domain = std::get<1>(Signals.first);
        }

        if (std::get<0>(Signals.first) != "secure"){
            for (MessageIndex = 0; MessageIndex < Signals.second.size(); MessageIndex++){
                DataPrimaryState.push_back(Signals.second.at(MessageIndex));

                for (BitIndex = 1; BitIndex < Code.MessageWidth; BitIndex++){
                    DataPrimaryState.emplace_back("1'b0");
                }
            }
        }else{
            DataPrimaryState.insert(DataPrimaryState.end(), Signals.second.begin(), Signals.second.end());

            // Pad data signals if necessary
            MessageIndex = DataPrimaryState.size();
            while (MessageIndex % Code.MessageWidth){
                DataPrimaryState.emplace_back("1'b0");
                MessageIndex++;
            }             
        }
    }

    // Prepare the redundant states with register inputs and outputs
    for (MessageIndex = 0; MessageIndex < DataPrimaryState.size(); MessageIndex += Code.MessageWidth){
        for (BitIndex = 0; BitIndex < Code.ParityWidth; BitIndex++){
            RedundancyPrimaryState.push_back(DataPrimaryState.at(MessageIndex));
            RedundancyPrimaryState.back().ModuleCounter = DataPrimaryState.at(MessageIndex).Index;
            RedundancyPrimaryState.back().Index = BitIndex;

            // Consider only primary control outputs from the redundancy
            if (RedundancyPrimaryState.back().Annotation != "control"){
                RedundancyPrimaryState.back().PrimaryOutput = false;
            }
        }
    }

    std::sort(Design.Reg.begin(), Design.Reg.end(), [](ImpeccableCircuitsII::Module& a, ImpeccableCircuitsII::Module& b) {
        if (a.Inputs.back().GetName().length() == b.Inputs.back().GetName().length()){
            return a.Inputs.back().GetName() < b.Inputs.back().GetName();
        }else{
            return a.Inputs.back().GetName().length() < b.Inputs.back().GetName().length();
        }
    });

    // Prepare the data states with register inputs and outputs
    for (RegisterIndex = 0; RegisterIndex < Design.Reg.size(); RegisterIndex++){
        if (Design.Reg.at(RegisterIndex).Inputs.back().Annotation == Design.Reg.at(RegisterIndex).Outputs.back().Annotation){
            Attribute = Design.Reg.at(RegisterIndex).Inputs.back().Annotation;
            Depth = Design.Reg.at(RegisterIndex).Inputs.back().Depth;

            if (ShareDomains.count(Design.Reg.at(RegisterIndex).Inputs.back().GetName())){
                ShareDomain = ShareDomains.at(Design.Reg.at(RegisterIndex).Inputs.back().GetName());
            }else if (ShareDomains.count(Design.Reg.at(RegisterIndex).Outputs.back().GetName())){
                ShareDomain = ShareDomains.at(Design.Reg.at(RegisterIndex).Outputs.back().GetName());
            }else{
                ShareDomain = 0;
            }

            IsReg = (Design.Reg.at(RegisterIndex).Inputs.back().GetName() != Design.Reg.at(RegisterIndex).Outputs.back().GetName()) ? true : false;
            SignalsBeforeReg[std::make_tuple(Attribute, ShareDomain, Depth, IsReg, Design.Reg.at(RegisterIndex).Inputs.back().Linear)].push_back(Design.Reg.at(RegisterIndex).Inputs.back());
            SignalsAfterReg[std::make_tuple(Attribute, ShareDomain, Depth, IsReg, Design.Reg.at(RegisterIndex).Outputs.back().Linear)].push_back(Design.Reg.at(RegisterIndex).Outputs.back());         
        }else{
            std::cout << "FAIL" << std::endl;
            std::cout << "The attributes of register input " << Design.Reg.at(RegisterIndex).Inputs.back().GetName() << " and register output " << Design.Reg.at(RegisterIndex).Outputs.back().GetName() << " do not match!" << std::endl;
            std::cout << "Please check the attribute propagation." << std::endl;
        }
    }

    for (auto& Signals: SignalsBeforeReg){
        for (MessageIndex = 0; MessageIndex < Signals.second.size(); MessageIndex++){
            Signals.second.at(MessageIndex).share_domain = std::get<1>(Signals.first);
        }

        if (std::get<0>(Signals.first) != "secure"){
            for (MessageIndex = 0; MessageIndex < Signals.second.size(); MessageIndex++){
                DataStateBeforeReg.push_back(Signals.second.at(MessageIndex));

                for (BitIndex = 1; BitIndex < Code.MessageWidth; BitIndex++){
                    DataStateBeforeReg.emplace_back("1'b0");
                }
            }
        }else{
            DataStateBeforeReg.insert(DataStateBeforeReg.end(), Signals.second.begin(), Signals.second.end());

            // Pad data signals if necessary
            MessageIndex = DataStateBeforeReg.size();
            while (MessageIndex % Code.MessageWidth){
                DataStateBeforeReg.emplace_back("1'b0");
                MessageIndex++;
            }             
        }
    }

    for (auto& Signals: SignalsAfterReg){
        for (MessageIndex = 0; MessageIndex < Signals.second.size(); MessageIndex++){
            Signals.second.at(MessageIndex).share_domain = std::get<1>(Signals.first);
        }

        if (std::get<0>(Signals.first) != "secure"){
            for (MessageIndex = 0; MessageIndex < Signals.second.size(); MessageIndex++){
                DataStateAfterReg.push_back(Signals.second.at(MessageIndex));

                for (BitIndex = 1; BitIndex < Code.MessageWidth; BitIndex++){
                    DataStateAfterReg.emplace_back("1'b0");
                }
            }
        }else{
            DataStateAfterReg.insert(DataStateAfterReg.end(), Signals.second.begin(), Signals.second.end());

            // Pad data signals if necessary
            MessageIndex = DataStateAfterReg.size();
            while (MessageIndex % Code.MessageWidth){
                DataStateAfterReg.emplace_back("1'b0");
                MessageIndex++;
            }               
        }
    }

    // Prepare the redundant states with register inputs and outputs
    for (MessageIndex = 0; MessageIndex < DataStateBeforeReg.size(); MessageIndex += Code.MessageWidth){
        for (BitIndex = 0; BitIndex < Code.ParityWidth; BitIndex++){
            RedundancyStateBeforeReg.push_back(DataStateBeforeReg.at(MessageIndex));
            RedundancyStateBeforeReg.back().ModuleCounter = DataStateBeforeReg.at(MessageIndex).Index;
            RedundancyStateBeforeReg.back().Index = BitIndex;

            RedundancyStateAfterReg.push_back(DataStateAfterReg.at(MessageIndex));
            RedundancyStateAfterReg.back().ModuleCounter = DataStateAfterReg.at(MessageIndex).Index;
            RedundancyStateAfterReg.back().Index = BitIndex;

            // Consider only primary control outputs from the redundancy
            if (RedundancyStateBeforeReg.back().Annotation != "control"){
                RedundancyStateBeforeReg.back().PrimaryOutput = false;
                RedundancyStateAfterReg.back().PrimaryOutput = false;
            }
        }
    }

    // Generate registers of the register stage
    for (RegisterIndex = 0; RegisterIndex < DataStateBeforeReg.size(); RegisterIndex++){
        // Add data input if it is no constant and is not already computed
        if (DataStateBeforeReg.at(RegisterIndex).GetName() != "1'b0"){
            Design.Reg1.Inputs.push_back(DataStateBeforeReg.at(RegisterIndex));
            Design.Reg1.Outputs.push_back(DataStateAfterReg.at(RegisterIndex));

            if (Design.Reg1.Inputs.back().GetName() == Design.Reg1.Outputs.back().GetName()){
                Design.Reg1.Inputs.back().Appendix = DataInputAppendix;
                Design.Reg1.Outputs.back().Appendix = DataOutputAppendix;
                Instruction = "assign " + Design.Reg1.Outputs.back().GetName() + " = " + Design.Reg1.Inputs.back().GetName() + ";";
                Design.Reg1.Instructions.push_back(Instruction);
            }else{
                Design.Reg1.Inputs.back().Appendix = DataInputAppendix;
                Design.Reg1.Outputs.back().Appendix = DataOutputAppendix;

                SharedRegisterInputs[Design.Reg1.Inputs.back().share_domain].push_back(Design.Reg1.Inputs.back().GetName());
                SharedRegisterOutputs[Design.Reg1.Outputs.back().share_domain].push_back(Design.Reg1.Outputs.back().GetName());
            }
        }
    }

    for (auto const& Register : SharedRegisterInputs){
        if (Register.second.size() > 0){
            Instruction = "register_stage #(.WIDTH(" + std::to_string(Register.second.size()) + ")) inst_" + std::to_string(Register.first) + "(.clk(" + Clock.GetName() + "), .D({" + Register.second.at(0);
            
            for (RegisterIndex = 1; RegisterIndex < Register.second.size(); RegisterIndex++){
                Instruction += "," + Register.second.at(RegisterIndex);
            }

            Instruction += "}), .Q({" + SharedRegisterOutputs.at(Register.first).at(0);

            for (RegisterIndex = 1; RegisterIndex < Register.second.size(); RegisterIndex++){
                Instruction += "," + SharedRegisterOutputs[Register.first].at(RegisterIndex);
            }

            Instruction += "}));";
            Design.Reg1.Instructions.push_back(Instruction);
        }
    }

    SharedRegisterInputs.clear();
    SharedRegisterOutputs.clear();

    std::sort(Design.Reg1.Inputs.begin(), Design.Reg1.Inputs.end(), [] (ImpeccableCircuitsII::Signal &lhs, ImpeccableCircuitsII::Signal &rhs) {return (lhs.GetName() < rhs.GetName());});
    Design.Reg1.Inputs.erase(std::unique(Design.Reg1.Inputs.begin(), Design.Reg1.Inputs.end(), [] (ImpeccableCircuitsII::Signal &lhs, ImpeccableCircuitsII::Signal &rhs) {return (lhs.GetName() == rhs.GetName());}), Design.Reg1.Inputs.end());

    for (RegisterIndex = 0; RegisterIndex < RedundancyStateBeforeReg.size(); RegisterIndex++){
        Design.Reg2.Inputs.push_back(RedundancyStateBeforeReg.at(RegisterIndex));
        Design.Reg2.Outputs.push_back(RedundancyStateAfterReg.at(RegisterIndex));

        if (Design.Reg2.Inputs.back().GetName() == Design.Reg2.Outputs.back().GetName()){
            Design.Reg2.Inputs.back().Appendix = RedundancyInputAppendix;
            Design.Reg2.Outputs.back().Appendix = RedundancyOutputAppendix;
            Instruction = "assign " + Design.Reg2.Outputs.back().GetName() + " = " + Design.Reg2.Inputs.back().GetName() + ";";
            Design.Reg2.Instructions.push_back(Instruction);
        }else{
            Design.Reg2.Inputs.back().Appendix = RedundancyInputAppendix;
            Design.Reg2.Outputs.back().Appendix = RedundancyOutputAppendix;
            
            SharedRegisterInputs[Design.Reg2.Inputs.back().share_domain].push_back(Design.Reg2.Inputs.back().GetName());
            SharedRegisterOutputs[Design.Reg2.Outputs.back().share_domain].push_back(Design.Reg2.Outputs.back().GetName());
        }
    }

    for (auto const& Register : SharedRegisterInputs){
        if (Register.second.size() > 0){
            Instruction = "register_stage #(.WIDTH(" + std::to_string(Register.second.size()) + ")) inst_" + std::to_string(Register.first) + "(.clk(" + Clock.GetName() + "), .D({" + Register.second.at(0);
            
            for (RegisterIndex = 1; RegisterIndex < Register.second.size(); RegisterIndex++){
                Instruction += "," + Register.second.at(RegisterIndex);
            }

            Instruction += "}), .Q({" + SharedRegisterOutputs.at(Register.first).at(0);

            for (RegisterIndex = 1; RegisterIndex < Register.second.size(); RegisterIndex++){
                Instruction += "," + SharedRegisterOutputs[Register.first].at(RegisterIndex);
            }

            Instruction += "}));";
            Design.Reg2.Instructions.push_back(Instruction);
        }
    }

    SharedRegisterInputs.clear();
    SharedRegisterOutputs.clear();

    std::sort(Design.Reg2.Inputs.begin(), Design.Reg2.Inputs.end(), [] (ImpeccableCircuitsII::Signal &lhs, ImpeccableCircuitsII::Signal &rhs) {return (lhs.GetName() < rhs.GetName());});
    Design.Reg2.Inputs.erase(std::unique(Design.Reg2.Inputs.begin(), Design.Reg2.Inputs.end(), [] (ImpeccableCircuitsII::Signal &lhs, ImpeccableCircuitsII::Signal &rhs) {return (lhs.GetName() == rhs.GetName());}), Design.Reg2.Inputs.end());
}

bool PrepareLinearComponents(unsigned int MessageWidth, std::vector<ImpeccableCircuitsII::Module>& Round, std::vector<ImpeccableCircuitsII::Module>& Register){
    std::cout << "Prepare the linear layer...";
    unsigned int InputIndex, OutputIndex, SignalIndex, TmpIndex, BucketSize, LinearInputsCtr = 0;
    bool Passed = true;

    std::vector<std::string> LinearInputsPerOutput, LinearInputs, LinearOutputs;
    std::map<std::string, std::vector<std::string>> IoMapping;
    std::map<std::string, unsigned int> NameToIndex;
    std::map<std::string, unsigned int> InputToIndex;

    for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
        LinearInputsPerOutput.clear(); 
        for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
            if (Round.at(OutputIndex).Inputs.at(InputIndex).Linear){
                LinearInputs.push_back(Round.at(OutputIndex).Inputs.at(InputIndex).GetName());

                if (Round.at(OutputIndex).Inputs.at(InputIndex).Annotation == "secure"){
                    LinearInputsCtr++;
                }else{
                    LinearInputsCtr+=MessageWidth;
                }

                LinearInputsPerOutput.push_back(Round.at(OutputIndex).Inputs.at(InputIndex).GetName());
            }   
        }

        if (Round.at(OutputIndex).Outputs.back().Linear){
            std::sort(LinearInputsPerOutput.begin(), LinearInputsPerOutput.end(), [](std::string& a, std::string& b) {if (a.length() == b.length()){return a < b;}else{return a.length() < b.length();}});
            LinearOutputs.push_back(Round.at(OutputIndex).Outputs.back().GetName());
            NameToIndex[Round.at(OutputIndex).Outputs.back().GetName()] = OutputIndex;
            IoMapping[Round.at(OutputIndex).Outputs.back().GetName()] = LinearInputsPerOutput;
        }     
    }

    std::sort(LinearInputs.begin(), LinearInputs.end(), [](std::string& a, std::string& b) {if (a.length() == b.length()){return a < b;}else{return a.length() < b.length();}});
    LinearInputs.erase(std::unique(LinearInputs.begin(), LinearInputs.end()), LinearInputs.end());
    std::sort(LinearOutputs.begin(), LinearOutputs.end(), [](std::string& a, std::string& b) {if (a.length() == b.length()){return a < b;}else{return a.length() < b.length();}});
    LinearOutputs.erase(std::unique(LinearOutputs.begin(), LinearOutputs.end()), LinearOutputs.end());
    std::cout << "#Linear Inputs: " << LinearInputs.size() << ", #Linear Outputs: " << LinearOutputs.size() << "..." << std::flush;

    if ((LinearInputsCtr % MessageWidth) || (LinearOutputs.size() % MessageWidth) || (LinearOutputs.size() == 0)){
        Passed = false;
    }

    if (Passed){
        std::vector<std::vector<std::string>> Buckets;

        for (OutputIndex = 0; OutputIndex < LinearOutputs.size(); OutputIndex += MessageWidth){
            BucketSize = 0;
            for (TmpIndex = 0; TmpIndex < MessageWidth; TmpIndex++){
                if (IoMapping[LinearOutputs.at(OutputIndex + TmpIndex)].size() > BucketSize){
                    BucketSize = IoMapping[LinearOutputs.at(OutputIndex + TmpIndex)].size();
                }
            }

            std::vector<std::vector<std::string>> NewBucket(BucketSize, std::vector<std::string>(MessageWidth, "1'b0"));

            for (TmpIndex = 0; TmpIndex < MessageWidth; TmpIndex++){
                for (InputIndex = 0; InputIndex < IoMapping[LinearOutputs.at(OutputIndex + TmpIndex)].size(); InputIndex++){
                    NewBucket.at(InputIndex).at(TmpIndex) = IoMapping[LinearOutputs.at(OutputIndex + TmpIndex)].at(InputIndex);
                } 
            }

            Buckets.insert(Buckets.end(), NewBucket.begin(), NewBucket.end());
        }

        for (OutputIndex = 0; OutputIndex < Buckets.size(); OutputIndex++){
            for (TmpIndex = 0; TmpIndex < MessageWidth; TmpIndex++){
                if (Buckets.at(OutputIndex).at(TmpIndex) == "1'b0"){
                    Passed = false;
                    break;
                }else{
                    if (InputToIndex.find(Buckets.at(OutputIndex).at(TmpIndex)) == InputToIndex.end()){
                        InputToIndex[Buckets.at(OutputIndex).at(TmpIndex)] = OutputIndex + 1;
                    }
                }
            }
        }
    }

    if (Passed){
        for (OutputIndex = 0; OutputIndex < LinearOutputs.size(); OutputIndex++){
            Round.at(NameToIndex[LinearOutputs.at(OutputIndex)]).Outputs.back().Linear = (OutputIndex / MessageWidth) + 1;

            for (InputIndex = 0; InputIndex < Round.at(NameToIndex[LinearOutputs.at(OutputIndex)]).Inputs.size(); InputIndex++){
                Round.at(NameToIndex[LinearOutputs.at(OutputIndex)]).Inputs.at(InputIndex).Linear = InputToIndex[Round.at(NameToIndex[LinearOutputs.at(OutputIndex)]).Inputs.at(InputIndex).GetName()];
            }     
        }
    }else{
        for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
            Round.at(OutputIndex).Outputs.back().Linear = 0;

            for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
                Round.at(OutputIndex).Inputs.at(InputIndex).Linear = 0;
            }       
        }  
    }

    for (SignalIndex = 0; SignalIndex < Register.size(); SignalIndex++){
        for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
            for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){ 
                if (Round.at(OutputIndex).Inputs.at(InputIndex).GetName() == Register.at(SignalIndex).Outputs.back().GetName()){
                    Register.at(SignalIndex).Outputs.back().Linear = Round.at(OutputIndex).Inputs.at(InputIndex).Linear;
                    Register.at(SignalIndex).Inputs.back().Linear = Round.at(OutputIndex).Inputs.at(InputIndex).Linear;
                    Register.at(SignalIndex).Inputs.back().Depth = Round.at(OutputIndex).Inputs.at(InputIndex).Depth;
                    Register.at(SignalIndex).Outputs.back().Depth = Round.at(OutputIndex).Inputs.at(InputIndex).Depth + 1;
                }
            }
        }      
    }

    if (Passed){
        std::cout << "PASSED" << std::endl;
        return true;
    }else{
        std::cout << "FAILED" << std::endl;
        return false;
    }
}

void ModifyRedundantState(ImpeccableCircuitsII::ErrorCorrectingCode& Code, std::vector<ImpeccableCircuitsII::Module>& Round, std::vector<ImpeccableCircuitsII::Module>& OldRound, std::vector<ImpeccableCircuitsII::Module>& InF, std::map<std::string, ImpeccableCircuitsII::Anf>& SignalToAnf, std::vector<ImpeccableCircuitsII::Signal>& DataSignals){
    unsigned int Index, InputIndex, MessageIndex, ParityIndex, PrimaryInputIndex, TmpIndex, BitIndex, Offset = 0;
    unsigned int OldParity, NewParity;
    std::vector<std::string> OldInstr(Code.MessageWidth);
    std::vector<std::string> NewInstr(Code.MessageWidth);
    std::string SignalName, Instruction;
    size_t InstructionIndex;
    ImpeccableCircuitsII::Signal Signal;
    std::vector<ImpeccableCircuitsII::Signal> TmpSignals;
    
    // Skip all chunks which are primary control signal outputs
    // Because of primary control outputs which are not in DataStateBeforeReg
    for (Index = 0; Index < (Round.size() / Code.ParityWidth); Index++){
        if (Round.at(Index * Code.ParityWidth).Outputs.back().PrimaryOutput){
            Offset++;
        }
    }

    for (Index = Offset; Index < (Round.size() / Code.ParityWidth); Index++){
        // Check if the functions of this chunk are all linear
        for (ParityIndex = 0; ParityIndex < Code.ParityWidth; ParityIndex++){
            for (InputIndex = 0; InputIndex < Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.size(); InputIndex++){
                if (!Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).Linear && (Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).Annotation != "reset")){
                    break;
                }
            }

            if (InputIndex != Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.size()){
                break;
            }
        }

        if (ParityIndex == Code.ParityWidth){
            OldParity = 0;
            for (MessageIndex = 0; MessageIndex < Code.MessageWidth; MessageIndex++){
                OldParity <<= 1;
                OldParity |= SignalToAnf[DataSignals.at((Index - Offset) * Code.MessageWidth + MessageIndex).GetName()].Parity & 1;
            }

            NewParity = Code.MessageToParity.Mapping.at(OldParity);

            Signal = DataSignals.at((Index - Offset) * Code.MessageWidth);
            Signal.Appendix = "_R1_out";

            for (TmpIndex = 0; TmpIndex < OldRound.size(); TmpIndex++){
                if (Signal.GetName() == OldRound.at(TmpIndex).Outputs.back().GetName()){
                    break;
                }
            }

            for (ParityIndex = 0; ParityIndex < Code.ParityWidth; ParityIndex++){
                for (InputIndex = 0; InputIndex < Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.size(); InputIndex++){  
                    // Set all indices to the ouput index
                    if (!Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).PrimaryInput){
                        Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).Index = Round.at(Index * Code.ParityWidth + ParityIndex).Outputs.back().Index;
                    }
                }

                // Remove primary data inputs
                Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.erase(std::remove_if(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.begin(), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end(), [](const ImpeccableCircuitsII::Signal& x) {return x.PrimaryInput && x.Annotation != "reset";}), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end());
            
                for (InputIndex = 0; InputIndex < OldRound.at(TmpIndex).Inputs.size(); InputIndex++){  
                    if (OldRound.at(TmpIndex).Inputs.at(InputIndex).PrimaryInput && OldRound.at(TmpIndex).Inputs.at(InputIndex).Annotation != "reset"){
                        Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.push_back(OldRound.at(TmpIndex).Inputs.at(InputIndex));
                    }
                }

                std::sort(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.begin(), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end(), [](ImpeccableCircuitsII::Signal& a, ImpeccableCircuitsII::Signal& b) {return a.GetName() < b.GetName();});
                Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.erase(std::unique(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.begin(), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end(), [](ImpeccableCircuitsII::Signal& a, ImpeccableCircuitsII::Signal& b) {return a.GetName() == b.GetName();}), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end());
                Round.at(Index * Code.ParityWidth + ParityIndex).Intermediates = OldRound.at(TmpIndex).Intermediates;
                Round.at(Index * Code.ParityWidth + ParityIndex).Instructions = OldRound.at(TmpIndex).Instructions;

                for (InputIndex = 0; InputIndex < OldRound.at(TmpIndex).Inputs.size(); InputIndex++){  
                    if (!OldRound.at(TmpIndex).Inputs.at(InputIndex).PrimaryInput){
                        Signal = OldRound.at(TmpIndex).Inputs.at(InputIndex);
                        Signal.Appendix = "_Reg2_out";
                        Signal.ModuleCounter = OldRound.at(TmpIndex).Inputs.at(InputIndex).Index;
                        Signal.Index = Round.at(Index * Code.ParityWidth + ParityIndex).Outputs.back().Index;
                        
                        for (InstructionIndex = 0; InstructionIndex < Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.size(); InstructionIndex++){
                            Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.at(InstructionIndex) = ImpeccableCircuitsII::ReplaceString(Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.at(InstructionIndex),  OldRound.at(TmpIndex).Inputs.at(InputIndex).GetName(), Signal.GetName());
                        } 
                    }
                }

                Signal = Round.at(Index * Code.ParityWidth + ParityIndex).Outputs.back();
                Signal.Appendix = "_tmp_out";

                for (InstructionIndex = 0; InstructionIndex < Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.size(); InstructionIndex++){
                    Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.at(InstructionIndex) = ImpeccableCircuitsII::ReplaceString(Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.at(InstructionIndex), OldRound.at(TmpIndex).Outputs.back().GetName(), Signal.GetName());
                }

                Round.at(Index * Code.ParityWidth + ParityIndex).Intermediates.push_back(Signal);
                Instruction = "assign " + Round.at(Index * Code.ParityWidth + ParityIndex).Outputs.back().GetName() + " = " + Signal.GetName() + " ^ " + "1'b" + std::to_string(OldParity & 1) + " ^ 1'b" + std::to_string((NewParity >> ParityIndex) & 1) + ";";
                Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.push_back(Instruction);
            }

            for (ParityIndex = 0; ParityIndex < Code.ParityWidth; ParityIndex++){
                TmpSignals.clear();

                for (InputIndex = 0; InputIndex < Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.size(); InputIndex++){  
                    if (!Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).PrimaryInput || (Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).Annotation != "reset")){
                        TmpSignals.push_back(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex));
                    }
                }

                Round.at(Index * Code.ParityWidth + ParityIndex).Inputs = TmpSignals;

                for (InputIndex = 0; InputIndex < OldRound.at(TmpIndex).Inputs.size(); InputIndex++){  
                    if (OldRound.at(TmpIndex).Inputs.at(InputIndex).Annotation == "reset"){
                        Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.push_back(OldRound.at(TmpIndex).Inputs.at(InputIndex));
                    }
                }
            }

            // Process primary inputs
            for (ParityIndex = 0; ParityIndex < Code.ParityWidth; ParityIndex++){
                TmpSignals.clear();
                for (InputIndex = 0; InputIndex < Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.size(); InputIndex++){  
                    if ((Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).PrimaryInput) && Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).Annotation != "reset"){
                        bool Found = false;

                        for (PrimaryInputIndex = 0; PrimaryInputIndex < InF.size(); PrimaryInputIndex += Code.ParityWidth){
                            for (MessageIndex = 0; MessageIndex < Code.ParityWidth; MessageIndex++){
                                for (BitIndex = 0; BitIndex < InF.at(PrimaryInputIndex + MessageIndex).Inputs.size(); BitIndex += Code.ParityWidth){
                                    if (InF.at(PrimaryInputIndex + MessageIndex).Inputs.at(BitIndex).GetName() == Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).GetName()){
                                        Found = true;
                                        break;
                                    }
                                }
                            }

                            if (Found){
                                break;
                            }
                        }

                        for (InstructionIndex = 0; InstructionIndex < Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.size(); InstructionIndex++){
                                Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.at(InstructionIndex) = ImpeccableCircuitsII::ReplaceString(Round.at(Index * Code.ParityWidth + ParityIndex).Instructions.at(InstructionIndex), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.at(InputIndex).GetName(), InF.at(PrimaryInputIndex + ParityIndex).Outputs.back().GetName());
                        } 

                        TmpSignals.push_back(InF.at(PrimaryInputIndex + ParityIndex).Outputs.back().GetName());
                    }
                }

                Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.insert(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end(), TmpSignals.begin(), TmpSignals.end());
                
                // Remove primary data inputs
                Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.erase(std::remove_if(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.begin(), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end(), [](const ImpeccableCircuitsII::Signal& x) {return x.PrimaryInput && x.Annotation != "reset";}), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end());
                std::sort(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.begin(), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end(), [](ImpeccableCircuitsII::Signal& a, ImpeccableCircuitsII::Signal& b) {return a.GetName() < b.GetName();});
                Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.erase(std::unique(Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.begin(), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end(), [](ImpeccableCircuitsII::Signal& a, ImpeccableCircuitsII::Signal& b) {return a.GetName() == b.GetName();}), Round.at(Index * Code.ParityWidth + ParityIndex).Inputs.end());
            }
        }
    }
}

void GenerateRoundFunctions(std::string SourcePath, std::string Topmodule, std::string AttributeReportFileName,  CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, ImpeccableCircuitsII::ErrorCorrectingCode& Code, ImpeccableCircuitsII::Design& Design, bool Comments){
    // Output file stream to write verilog circuit
    std::string DirectoryPath = SourcePath.substr(0, SourcePath.find_last_of("/"));
    std::string DestinationPath = DirectoryPath + "/" + Topmodule + "_Round.v";
    std::cout << "Store: " << DestinationPath << std::endl;
    std::string NameOfSignal;
    std::ofstream Netlist(DestinationPath);   
    unsigned int InputIndex, OutputIndex, TmpIndex; 
    
    std::string ResetSignalName = SecureCombCircuit->Signals[SecureCombCircuit->ResetSignalIndex]->Name;

    // Print module information
    if (Comments){
        Netlist << "// Generated by AGEMA (https://github.com/Chair-for-Security-Engineering/AGEMA)" << std::endl;
        Netlist << std::endl;
    }

    std::vector<ImpeccableCircuitsII::Signal> DataStateBeforeReg, DataStateAfterReg, RedundancyStateBeforeReg, RedundancyStateAfterReg, DataPrimaryState, RedundancyPrimaryState;
    ImpeccableCircuitsII::Signal Clock;

    // Prepare clock signal
    Clock.Name = Circuit->Signals[Circuit->ClockSignalIndex]->Name;
    Clock.Annotation = "clock";
    Clock.PrimaryInput = true;

    Design.Decomposed = PrepareLinearComponents(Code.MessageWidth, Design.R, Design.Reg);
    GenerateRegisterModule(SourcePath, Topmodule, AttributeReportFileName, Code, Clock, Design, DataStateBeforeReg, RedundancyStateBeforeReg, DataStateAfterReg, RedundancyStateAfterReg, DataPrimaryState, RedundancyPrimaryState, "Reg1", "_R1_out", "_Reg1_out", "Reg2", "_F2_2_out", "_Reg2_out");
    Design.Reg1.PrintModule(Netlist, Comments, false);
    Design.Reg2.PrintModule(Netlist, Comments, false);

    std::vector<ImpeccableCircuitsII::Module> InF, R1, R2, F1_1, F2_1, F2_2, Finv, Xor1_1, Xor2_1, Xor1_2, Xor2_2, Sd1, Sd2;

    InF = PrepareRedundantLayer(Code.MessageWidth, DataPrimaryState, RedundancyPrimaryState, Design.F, "no_appendix", "no_appendix", "_InF_out");

    // Upper half
    F1_1 = PrepareRedundantLayer(Code.MessageWidth, DataStateAfterReg, RedundancyStateAfterReg, Design.F, "_Reg1_out", "_Reg1_out", "_F1_1_out");
    Xor1_1 = PrepareXorLayer(RedundancyStateAfterReg, "_F1_1_out", "_Reg2_out", "_Xor1_1_out");
    Sd1 = PrepareRedundantLayer(Code.ParityWidth, RedundancyStateAfterReg, DataStateAfterReg, Design.Sd1, "_Xor1_1_out", "_Xor1_1_out", "_Sd1_out");
    Xor1_2 = PrepareXorLayer(DataStateAfterReg, "_Sd1_out", "_Reg1_out", "_Xor1_2_out");
    R1 = PrepareRoundLayer(Design.R, "_Xor1_2_out", "_Reg1_out", "_R1_out");

    // Lower half
    F2_1 = PrepareRedundantLayer(Code.MessageWidth, DataStateAfterReg, RedundancyStateAfterReg, Design.F, "_Reg1_out", "_Reg1_out", "_F2_1_out");
    Xor2_1 = PrepareXorLayer(RedundancyStateAfterReg, "_F2_1_out", "_Reg2_out", "_Xor2_1_out");
    Sd2 = PrepareRedundantLayer(Code.ParityWidth, RedundancyStateAfterReg, RedundancyStateAfterReg, Design.Sd2, "_Xor2_1_out", "_Xor2_1_out", "_Sd2_out");
    Xor2_2 = PrepareXorLayer(RedundancyStateAfterReg, "_Sd2_out", "_Reg2_out", "_Xor2_2_out");   
    
    Finv = PrepareRedundantLayer(Code.ParityWidth, RedundancyStateAfterReg, DataStateAfterReg, Design.InvF, "_Xor2_2_out", "_Reg2_out", "_Finv_out");
    R2 = PrepareRoundLayer(Design.R, "_Finv_out", "_Finv_out",  "_R2_out");
    F2_2 = PrepareRedundantLayer(Code.MessageWidth, DataStateBeforeReg, RedundancyStateBeforeReg, Design.F, "_R2_out", "_R2_out", "_F2_2_out");

    for (OutputIndex = 0; OutputIndex < Finv.size(); OutputIndex++){Finv.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < F1_1.size(); OutputIndex++){F1_1.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < F2_1.size(); OutputIndex++){F2_1.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < Xor1_1.size(); OutputIndex++){Xor1_1.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < Xor2_1.size(); OutputIndex++){Xor2_1.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < R1.size(); OutputIndex++){R1.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < R2.size(); OutputIndex++){R2.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < Sd1.size(); OutputIndex++){Sd1.at(OutputIndex).Outputs.back().PrimaryOutput = false;}
    for (OutputIndex = 0; OutputIndex < Sd2.size(); OutputIndex++){Sd2.at(OutputIndex).Outputs.back().PrimaryOutput = false;}

    for (OutputIndex = 0; OutputIndex < Xor2_2.size(); OutputIndex++){
        if (Xor2_2.at(OutputIndex).Outputs.back().Annotation != "control"){
            Xor2_2.at(OutputIndex).Outputs.back().PrimaryOutput = false;
        }
    }        
    
    std::vector<ImpeccableCircuitsII::Module> Fx, R1x, R1ind, FR2, FR2Finv, FR2FinvX, FR2FinvXSd2, FR2FinvXSd2x, R2ind;

    // Upper half
    Fx = ImpeccableCircuitsII::CombineTwoLayersIndependently(F1_1, Xor1_1, "Fx");
    R1x = ImpeccableCircuitsII::CombineTwoLayersIndependently(Xor1_2, R1, "R1x");
    R1ind = ImpeccableCircuitsII::CombineTwoLayersIndependently(Sd1, R1x, "R1ind");

    // Lower half
    FR2 = ImpeccableCircuitsII::CombineTwoLayersIndependently(R2, F2_2, "FR2");
    FR2Finv = ImpeccableCircuitsII::CombineTwoLayersIndependently(Finv, FR2, "FR2Finv");
    FR2FinvX = ImpeccableCircuitsII::CombineTwoLayersIndependently(Xor2_2, FR2Finv, "FR2FinvX");
    FR2FinvXSd2 = ImpeccableCircuitsII::CombineTwoLayersIndependently(Sd2, FR2FinvX, "FR2FinvXSd2");
    FR2FinvXSd2x = ImpeccableCircuitsII::CombineTwoLayersIndependently(Xor2_1, FR2FinvXSd2, "FR2FinvXSd2x");
    R2ind = ImpeccableCircuitsII::CombineTwoLayersIndependently(F2_1, FR2FinvXSd2x, "R2ind");

    if (Design.Decomposed){
        ModifyRedundantState(Code, R2ind, R1, InF, Design.SignalToAnf, DataStateBeforeReg);
    }

    // Remove unused modules
    for (OutputIndex = 0; OutputIndex < Fx.size(); OutputIndex++){
        for (TmpIndex = 0; TmpIndex < R1ind.size(); TmpIndex++){
            for (InputIndex = 0; InputIndex < R1ind.at(TmpIndex).Inputs.size(); InputIndex++){
                if (Fx.at(OutputIndex).Outputs.back().GetName() == R1ind.at(TmpIndex).Inputs.at(InputIndex).GetName()){
                    break;
                }
            }
                
            if (InputIndex != R1ind.at(TmpIndex).Inputs.size()){
                break;
            }
        }

        if (TmpIndex == R1ind.size()){
            Fx.at(OutputIndex).Inputs.clear();
            Fx.at(OutputIndex).Outputs.clear();
            Fx.at(OutputIndex).Instructions.clear();
        }
    }

    Fx.erase(std::remove_if(Fx.begin(), Fx.end(), [](ImpeccableCircuitsII::Module Module) { return (Module.Inputs.empty() && Module.Outputs.empty()); }), Fx.end());

    for (OutputIndex = 0; OutputIndex < R2ind.size(); OutputIndex++){
        for (int Index = OutputIndex - 1; Index >= 0; Index--){
            if (R2ind.at(Index).Outputs.size()){
                if (R2ind.at(OutputIndex).Outputs.back().GetName() == R2ind.at(Index).Outputs.back().GetName()){
                    R2ind.at(OutputIndex).Inputs.clear();
                    R2ind.at(OutputIndex).Outputs.clear();
                    R2ind.at(OutputIndex).Instructions.clear();
                    break;
                }
            }
        }
    }

    R2ind.erase(std::remove_if(R2ind.begin(), R2ind.end(), [](ImpeccableCircuitsII::Module Module) { return (Module.Inputs.empty() && Module.Outputs.empty()); }), R2ind.end());

    if (Design.Decomposed){
        Design.InF = BuildTopmodule(InF, "InF");
        Design.InF.Instructions.clear();

        for (OutputIndex = 0; OutputIndex < InF.size(); OutputIndex++){
            Design.InF.Instructions.push_back(InF.at(OutputIndex).Instructions.back());
        }

        Design.InF.PrintModule(Netlist, Comments, false);    
    }

    Design.Fx = BuildTopmodule(Fx, "FX");
    ImpeccableCircuitsII::PrintModules(Fx, Netlist, Comments, true);
    Design.Fx.PrintModule(Netlist, Comments, false);

    Design.R1_ind = BuildTopmodule(R1ind, "R1_ind");
    ImpeccableCircuitsII::PrintModules(R1ind, Netlist, Comments, true);
    Design.R1_ind.PrintModule(Netlist, Comments, false);
    
    Design.R2_ind = BuildTopmodule(R2ind, "R2_ind");
    ImpeccableCircuitsII::PrintModules(R2ind, Netlist, Comments, true);
    Design.R2_ind.PrintModule(Netlist, Comments, false);

    Netlist.close();
}

int convertImpeccableCircuitsII(std::string SourcePath, std::string Topmodule, std::string AttributeReportFileName, LibraryStruct* Library, CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, char k, char Order, bool NoOptimize){
    // Comments for debugging
    bool Comments = false;
    
    bool Optimize = !NoOptimize;
    timespec Begin, End;

    clock_gettime(CLOCK_REALTIME, &Begin);

    // Check if inputs and outputs are correct
    bool Correct, OneNotCorrect = false;
    std::string RoundFunctionInput, PrimaryInput, FeedbackSignal;

    std::cout << "Check all round function inputs. Every round function input must be a primary input or feedback signal..." << std::flush;
    for (int i = 0; i < SecureCombCircuit->NumberOfInputs; i++){
        Correct = false;
        RoundFunctionInput = SecureCombCircuit->Signals[SecureCombCircuit->Inputs[i]]->Name;

        for (int j = 0; j < Circuit->NumberOfInputs; j++){
            PrimaryInput = Circuit->Signals[Circuit->Inputs[j]]->Name;
            if (PrimaryInput == RoundFunctionInput){
                Correct = true;
            }
        }

        if (!Correct){
            for (int j = 0; j < Circuit->NumberOfRegs; j++){
                FeedbackSignal = Circuit->Signals[Circuit->Cells[Circuit->Regs[j]]->Outputs[0]]->Name;

                if (FeedbackSignal == RoundFunctionInput){
                    Correct = true;
                }
            }     
        }   

        if (!Correct){
            std::cout << "Problem with: " << RoundFunctionInput << std::endl;
            OneNotCorrect = true;
        }
    }

    // Create error correcting code
    if (!OneNotCorrect){
        std::cout << "PASS" << std::endl;
        ImpeccableCircuitsII::ErrorCorrectingCode Code(k, Order, Optimize);

        // Create design functions
        ImpeccableCircuitsII::Design Design(Library, Circuit, SecureCombCircuit, Code, Comments);
        //Design.PrintCodes(SourcePath, Topmodule, Comments);

        GenerateRoundFunctions(SourcePath, Topmodule, AttributeReportFileName, Circuit, SecureCombCircuit, Code, Design, Comments);
        BuildMainFile(SourcePath, Topmodule, AttributeReportFileName, Design, Circuit, Code, Comments);
    }else{
        std::cout << "FAIL" << std::endl;
        std::cout << "Remember that AGEMA has difficulties to handle the flip-flops when both outputs are used." << std::endl;
        std::cout << "The resulting netlist should be edited by replacing all DFF_X1 modules by MyDFF." << std::endl;
        std::cout << "The edited (yet non-flattended) netlist together with the MyDFF.v file should be recompiled." << std::endl;
    }

    clock_gettime(CLOCK_REALTIME, &End);
    long TimeInSeconds = End.tv_sec - Begin.tv_sec;
    long TimeInNanoseconds = End.tv_nsec - Begin.tv_nsec;
    double ElapsedTimePeriod = TimeInSeconds + TimeInNanoseconds*1e-9;
    std::cout << "Impeccable Circuits II done in " << ElapsedTimePeriod << "s." << std::endl;

    return 0;
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




