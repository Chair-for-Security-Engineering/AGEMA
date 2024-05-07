#include "ImpeccableCircuitsII/design.hpp"

void ImpeccableCircuitsII::PrintRegister(std::ofstream& Netlist){
    Netlist << "module register_stage(clk, D, Q);" << std::endl;
    Netlist << "  parameter WIDTH = 8;" << std::endl;
    Netlist << "  input clk;" << std::endl;
    Netlist << "  input [WIDTH-1:0] D;" << std::endl;
    Netlist << "  output [WIDTH-1:0] Q;" << std::endl;
    Netlist << std::endl;
    Netlist << "  reg [WIDTH-1:0] s_current_state;" << std::endl;
    Netlist << "  wire [WIDTH-1:0] s_next_state;" << std::endl;
    Netlist << "  assign s_next_state = D;" << std::endl;
    Netlist << "  always @ (posedge clk)" << std::endl;
    Netlist << "  begin" << std::endl;
    Netlist << "      s_current_state <= s_next_state;" << std::endl;
    Netlist << "  end" << std::endl; 
    Netlist << "  assign Q = s_current_state;" << std::endl;
    Netlist << "endmodule" << std::endl;
    Netlist << std::endl;
}

void ImpeccableCircuitsII::PrintMultiplexer(std::ofstream& Netlist, std::vector<ImpeccableCircuitsII::Signal>& Outputs, int k){
    Netlist << "module multiplexer(s, d, q);" << std::endl;
    Netlist << "  parameter WIDTH = 8;" << std::endl;
    Netlist << "  input [" << k << ":0] s;" << std::endl;
    Netlist << "  input [WIDTH-1:0] d;" << std::endl;    
    Netlist << "  output [WIDTH-1:0] q;" << std::endl;
    Netlist << std::endl;

    std::map<unsigned int, std::vector<unsigned int>> SharedOutputs;
    std::string Instruction;
    size_t OutputIndex;

    for (OutputIndex = 0; OutputIndex < Outputs.size(); OutputIndex++){
        SharedOutputs[Outputs.at(OutputIndex).share_domain].push_back(OutputIndex);
    }
    
    for (auto const& Group : SharedOutputs){
        if (Group.second.size() > 0){
            Instruction = "  muxtree #(.WIDTH(" + std::to_string(Group.second.size()) + ")) inst_" + std::to_string(Group.first) + "(.s(s), .d({d[" + std::to_string(Group.second.at(0)) + "]";

            for (OutputIndex = 1; OutputIndex < Group.second.size(); OutputIndex++){
                Instruction += ",d[" + std::to_string(Group.second.at(OutputIndex)) + "]";
            }

            Instruction += "}), .q({q[" + std::to_string(Group.second.at(0)) + "]";

            for (OutputIndex = 1; OutputIndex < Group.second.size(); OutputIndex++){
                Instruction += ",q[" + std::to_string(Group.second.at(OutputIndex)) + "]";
            }

            Instruction += "}));";
            Netlist << Instruction << std::endl;
        }
    }

    Netlist << "endmodule" << std::endl;
    Netlist << std::endl;
}

void ImpeccableCircuitsII::PrintMultiplexerTree(std::ofstream& Netlist, int k, unsigned int RedundandDoneSignal){
    Netlist << "module muxtree(s, d, q);" << std::endl;
    Netlist << "  parameter WIDTH = 8;" << std::endl;
    Netlist << "  input [" << k << ":0] s;" << std::endl;
    Netlist << "  input [WIDTH-1:0] d;" << std::endl;    
    Netlist << "  output [WIDTH-1:0] q;" << std::endl;
    Netlist << std::endl;

    for (int i = 0; i < k; i++){
        for (int j = 0; j < (1 << (i+1)); j++){
            Netlist << "  wire [WIDTH-1:0] v" << i << "_" << j << ";" << std::endl;
        }
    }   

    Netlist << std::endl;
    Netlist << "  assign q = s[0] ? v0_1 : {WIDTH{1'b0}};" << std::endl;
    Netlist << std::endl;

    for (int i = 1; i < k + 1; i++){
        unsigned int tmp = 0;
        if (i == k){
            for (int j = 0; j < (1 << i); j++){
                if (j == (RedundandDoneSignal >> 1)){
                    if (RedundandDoneSignal % 2){
                        Netlist << "  assign v" << i - 1 << "_" << j << " = s[" << i << "] ? d : {WIDTH{1'b0}};" << std::endl;
                    }else{
                        Netlist << "  assign v" << i - 1 << "_" << j << " = s[" << i << "] ? {WIDTH{1'b0}} : d;" << std::endl;
                    }                    
                }else{
                    // Netlist << "  assign v" << i - 1 << "_" << j << " = s[" << i << "] ? multiplexer #(.WIDTH(WIDTH)) mux_inst_" << i << "_" << j << "(.d0({WIDTH{1'b0}}), .d1({WIDTH{1'b0}}), .s(s[" << i << "]), .q(v" << i - 1 << "_" << j << "));" << std::endl;
                    Netlist << "  assign v" << i - 1 << "_" << j << " = {WIDTH{1'b0}};" << std::endl;
                }
            }
        }else{
            for (int j = 0; j < (1 << i); j++){
                if (RedundandDoneSignal >> (k - i) & 1){
                    tmp++;
                    Netlist << "  assign v" << i - 1 << "_" << j << " = s[" << i << "] ? v" << i << "_" << tmp++ << " : {WIDTH{1'b0}};" << std::endl;
                }else{
                    Netlist << "  assign v" << i - 1 << "_" << j << " = s[" << i << "] ? {WIDTH{1'b0}} : v" << i << "_" << tmp++ << ";" << std::endl;
                    tmp++;
                }
            }  
        }
        Netlist << std::endl;
    }

    Netlist << "endmodule" << std::endl;
    Netlist << std::endl;    
}

ImpeccableCircuitsII::Design::Design(LibraryStruct* Library, CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, ImpeccableCircuitsII::ErrorCorrectingCode& Code, bool Comments){
    Xor  = ImpeccableCircuitsII::ConvertLutToModule(Code.SimpleXor, "OurXor");
    F    = ImpeccableCircuitsII::ConvertLutToModule(Code.MessageToParity, "F");
    InvF = ImpeccableCircuitsII::ConvertLutToModule(Code.ParityToMessage, "InvF");
    Sd1  = ImpeccableCircuitsII::ConvertLutToModule(Code.SyndromeDecoder[0], "Sd1");
    Sd2  = ImpeccableCircuitsII::ConvertLutToModule(Code.SyndromeDecoder[1], "Sd2");

    ImpeccableCircuitsII::ConvertRoundToModule(Library, Circuit, SecureCombCircuit, R, Reg, "Round", SignalToAnf);
    RedundandDoneSignal = Code.MessageToParity.Mapping[1] ^ (1 << Code.ParityWidth);
}

std::vector<ImpeccableCircuitsII::Module> ImpeccableCircuitsII::CombineTwoLayersIndependently(std::vector<ImpeccableCircuitsII::Module>& PreModule, std::vector<ImpeccableCircuitsII::Module>& PostModule, std::string ModuleName){
    std::vector<ImpeccableCircuitsII::Module> Result;
    unsigned int InputIndex, IntermediateIndex, OutputIndex, NumberOfInputs, InstructionIndex;
    std::vector<std::string> AlreadyComputedPrimaryOutputs;
    ImpeccableCircuitsII::Signal PrimaryOutputSignal;
    std::string Instr;
    bool Intermediate;
    ImpeccableCircuitsII::Module Module;
    std::string Instruction, AssignedIntermediate;

    for (OutputIndex = 0; OutputIndex < PreModule.size(); OutputIndex++){
        if (PreModule.at(OutputIndex).Outputs.at(0).PrimaryOutput){
            PrimaryOutputSignal = PreModule.at(OutputIndex).Outputs.at(0);
            PrimaryOutputSignal.Appendix = "_Final";

            if (std::find(AlreadyComputedPrimaryOutputs.begin(), AlreadyComputedPrimaryOutputs.end(), PrimaryOutputSignal.GetName()) == AlreadyComputedPrimaryOutputs.end()){
                Result.push_back(Module);
                Result.back().Inputs.push_back(PreModule.at(OutputIndex).Outputs.at(0));
                Result.back().Outputs.push_back(PrimaryOutputSignal);
                Result.back().Instructions.push_back("assign " + PrimaryOutputSignal.GetName() + " = " + PreModule.at(OutputIndex).Outputs.at(0).GetName() + ";");
                AlreadyComputedPrimaryOutputs.push_back(PrimaryOutputSignal.GetName());
            }

            PreModule.at(OutputIndex).Outputs.at(0).PrimaryOutput = false;
        }
    }

    Result.insert(Result.end(), PostModule.begin(), PostModule.end());

    for (OutputIndex = 0; OutputIndex < Result.size(); OutputIndex++){
        // Change module name
        Result.at(OutputIndex).ModuleName = ModuleName + std::to_string(OutputIndex);
        Result.at(OutputIndex).InstanceName = Result.at(OutputIndex).ModuleName + "_inst";
        NumberOfInputs = Result.at(OutputIndex).Inputs.size();

        for (InputIndex = 0; InputIndex < NumberOfInputs; InputIndex++){
            Intermediate = false;

            // Check if the input of the post module is the output of a previously computed module
            for (IntermediateIndex = 0; IntermediateIndex < PreModule.size(); IntermediateIndex++){
                if (Result.at(OutputIndex).Inputs.at(InputIndex).GetName() == PreModule.at(IntermediateIndex).Outputs.at(0).GetName()){
                    // Add the new primary inputs
                    AddSignals(PreModule.at(IntermediateIndex).Inputs, Result.at(OutputIndex).Inputs, Result.at(OutputIndex).Inputs, Result.at(OutputIndex).Outputs);              
                    //AddSignals(PreModule.at(IntermediateIndex).Outputs,Result.at(OutputIndex).Intermediates, Result.at(OutputIndex).Intermediates, Result.at(OutputIndex).Outputs);              

                    // Add its computing instructions
                    for (InstructionIndex = 0; InstructionIndex < PreModule.at(IntermediateIndex).Instructions.size(); InstructionIndex++){
                        Instruction = PreModule.at(IntermediateIndex).Instructions.at(InstructionIndex);
                        AssignedIntermediate = Instruction.substr(Instruction.find("assign") + 7, Instruction.find("=") - Instruction.find("assign") - 8);

                        if (std::find(Result.at(OutputIndex).Intermediates.begin(), Result.at(OutputIndex).Intermediates.end(), AssignedIntermediate) == Result.at(OutputIndex).Intermediates.end()){
                            Result.at(OutputIndex).Instructions.push_back(PreModule.at(IntermediateIndex).Instructions.at(InstructionIndex));
                            Result.at(OutputIndex).Intermediates.push_back(AssignedIntermediate);
                        }
                    }

                    Intermediate = true;
                    break;
                }
            }

            if (!Intermediate){
                if (Result.at(OutputIndex).Inputs.at(InputIndex).GetName() != "1'b0"){
                    Result.at(OutputIndex).Inputs.push_back(Result.at(OutputIndex).Inputs.at(InputIndex));
                }
            }
        }

        // Remove old function inputs
        Result.at(OutputIndex).Inputs.erase(Result.at(OutputIndex).Inputs.begin(), Result.at(OutputIndex).Inputs.begin() + NumberOfInputs);
    }

    return Result;
}
