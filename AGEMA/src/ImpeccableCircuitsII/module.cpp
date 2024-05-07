#include "ImpeccableCircuitsII/module.hpp"

void ImpeccableCircuitsII::Module::SetModuleAndInstanceName(std::string Module, std::string Instance, std::string Appendix, unsigned int Index){
    ModuleName = Module;
    InstanceName = Instance + Appendix + "_" + std::to_string(Index);
}

void ImpeccableCircuitsII::DefinePorts(std::ofstream& Netlist, bool Comments, std::vector<ImpeccableCircuitsII::Signal>& Signals, std::string PortName, std::string SignalName){
    if (Comments){
        if (Signals.size()){
            Netlist << "  /* " + PrintSignals(Signals) + " */" << std::endl;
        }
    }

    if (Signals.size() > 1){
        Netlist << " " << PortName << " [" << Signals.size() - 1 << ":0] " << SignalName << ";" << std::endl;
    }else if (Signals.size() == 1){
        Netlist << " " << PortName << " " << SignalName << ";" << std::endl;
    }    
}

void ImpeccableCircuitsII::Module::PrintHeader(std::ofstream& Netlist, bool Comments){        
    Netlist << "module " << ModuleName;
    if (Inputs.size()){
        Netlist << "(x, y);" << std::endl;
    }else{
        Netlist << "(y);" << std::endl;
    }

    DefinePorts(Netlist, Comments, Inputs, "input", "x");
    DefinePorts(Netlist, Comments, Outputs, "output", "y");
    Netlist << std::endl;
    DefinePorts(Netlist, Comments, Intermediates, "wire", "t");
}

void ImpeccableCircuitsII::Module::PrintBody(std::ofstream& Netlist, bool Sorted){
    ImpeccableCircuitsII::ReplaceSignalNames(Inputs, Intermediates, Outputs, Instructions, "x", "t", "y");
    std::vector<std::string> SortedInstructions = Instructions;

    if (Sorted){
        std::sort(SortedInstructions.begin(), SortedInstructions.end());
    }

    for (size_t InstrIndex = 0; InstrIndex < SortedInstructions.size(); InstrIndex++){
        Netlist << "  "  << SortedInstructions.at(InstrIndex) << std::endl;
    }  
}

void ImpeccableCircuitsII::Module::PrintModule(std::ofstream& Netlist, bool Comments, bool Sorted){
    PrintHeader(Netlist, Comments);
    PrintBody(Netlist, Sorted);
    Netlist << "endmodule" << std::endl << std::endl;
}

std::string ImpeccableCircuitsII::Module::PrintInstance(){
    if (Inputs.size()){
        return ModuleName + " " + InstanceName + "(.x(" + PrintSignals(Inputs) + "), .y(" + PrintSignals(Outputs) + "));";
    }else{
        return ModuleName + " " + InstanceName + "(.y(" + PrintSignals(Outputs) + "));";
    }
}

std::string ImpeccableCircuitsII::ReplaceString(std::string Subject, const std::string& Search, const std::string& Replace) {
    size_t pos = 0;
    while((pos = Subject.find(Search, pos)) != std::string::npos) {
        if (Subject[pos-1] != '.'){ // Don't change port names
            Subject.replace(pos, Search.length(), Replace);        
            pos += Replace.length();
        }else{
            pos ++;
        }
    }

    return Subject;
}

void ImpeccableCircuitsII::CreateSignalNameMapping(std::vector<ImpeccableCircuitsII::Signal>& Signals, std::string Replacement, std::vector<std::pair<std::string, std::string>>& Mapping){
    std::pair<std::string, std::string> Name;
    
    for (size_t SignalIndex = 0; SignalIndex < Signals.size(); SignalIndex++){
        Name.first = Signals.at(SignalIndex).GetName();
        Name.second = Replacement;
            
        if (Signals.size() > 1){
            Name.second += "[" + std::to_string(SignalIndex) + "]";
        }

        Mapping.push_back(Name);
    }
}

void ImpeccableCircuitsII::ReplaceSignalNames(std::vector<ImpeccableCircuitsII::Signal>& Inputs, std::vector<ImpeccableCircuitsII::Signal>& Intermediates, std::vector<ImpeccableCircuitsII::Signal>& Outputs, std::vector<std::string>& Instructions, std::string InputReplacement, std::string IntermediateReplacement, std::string OutputReplacement){
    size_t InstructionIndex, SignalIndex;
    std::vector<std::pair<std::string, std::string>> Mapping;

    ImpeccableCircuitsII::CreateSignalNameMapping(Inputs, InputReplacement, Mapping);
    ImpeccableCircuitsII::CreateSignalNameMapping(Intermediates, IntermediateReplacement, Mapping);
    ImpeccableCircuitsII::CreateSignalNameMapping(Outputs, OutputReplacement, Mapping);

    // Sort the mapping in a way that the longest signal names are processed first
    std::sort(Mapping.begin(), Mapping.end(), [](const std::pair<std::string, std::string>& lhs, const std::pair<std::string, std::string>& rhs){return lhs.first.size() > rhs.first.size();});

    // Replace all mapped inputs in the instructions
    for (InstructionIndex = 0; InstructionIndex < Instructions.size(); InstructionIndex++){
        for (SignalIndex = 0; SignalIndex < Mapping.size(); SignalIndex++){
            Instructions.at(InstructionIndex) = ReplaceString(Instructions.at(InstructionIndex), Mapping.at(SignalIndex).first, Mapping.at(SignalIndex).second);
        }
    }
}

void ImpeccableCircuitsII::AddSignal(ImpeccableCircuitsII::Signal& Signal, std::vector<ImpeccableCircuitsII::Signal>& Inputs, std::vector<ImpeccableCircuitsII::Signal>& Intermediates, std::vector<ImpeccableCircuitsII::Signal>& Outputs){ 
    // Check if the new intermediate is already integrated to the intermediates
    if ((std::find(Intermediates.begin(), Intermediates.end(), Signal) == Intermediates.end()) && Signal.Name != "1'b0" && Signal.Name != "1'b1"){
        // Check if the input is an primary output
        if (std::find(Outputs.begin(), Outputs.end(), Signal) == Outputs.end()){
            // If the input is not integrated, integrate it as the last input
            if (std::find(Inputs.begin(), Inputs.end(), Signal) == Inputs.end()){
                Intermediates.push_back(Signal);
            }
        }
    }
}  

void ImpeccableCircuitsII::AddSignals(std::vector<ImpeccableCircuitsII::Signal>& Signals, std::vector<ImpeccableCircuitsII::Signal>& Inputs, std::vector<ImpeccableCircuitsII::Signal>& Intermediates, std::vector<ImpeccableCircuitsII::Signal>& Outputs){    
    // Iterate through all signals that should be integrated
    for (size_t SignalIndex = 0; SignalIndex < Signals.size(); SignalIndex++){  
        AddSignal(Signals.at(SignalIndex), Inputs, Intermediates, Outputs);
    }
}

void ImpeccableCircuitsII::PrintModules(std::vector<ImpeccableCircuitsII::Module>& Modules, std::ofstream& Netlist, bool Comments, bool Sorted){
    for (size_t ModuleIndex = 0; ModuleIndex < Modules.size(); ModuleIndex++){
        Modules.at(ModuleIndex).PrintModule(Netlist, Comments, Sorted);
    }
}

std::string ImpeccableCircuitsII::PrintSumOfProducts(ImpeccableCircuitsII::LookupTable& Lut, std::string ModuleName, unsigned int Index){
    std::string Result = "assign " + ModuleName + "_out[" + std::to_string(Index) + "] = ";
    bool FirstVariable, FirstMonomial = true;
    size_t BitIndex, InputIndex;

    for (InputIndex = 0; InputIndex < Lut.SumOfProducts.at(Index).size(); InputIndex++){
        FirstVariable = true;
            
        if (FirstMonomial){
            Result += "(";
            FirstMonomial = false;
        }else{
            Result += " | (";
        }
            
        for (BitIndex = 0; BitIndex < Lut.SumOfProducts.at(Index).at(InputIndex).size(); BitIndex++){
            if (Lut.SumOfProducts.at(Index).at(InputIndex).at(BitIndex) == 1){
                if (FirstVariable){
                    Result += ModuleName + "_in[" + std::to_string(BitIndex) + "]"; 
                    FirstVariable = false;
                }else{
                    Result += " & " + ModuleName + "_in[" + std::to_string(BitIndex) + "]"; 
                }
            }else if (Lut.SumOfProducts.at(Index).at(InputIndex).at(BitIndex) == 0){
                if (FirstVariable){
                    Result += "~" + ModuleName + "_in[" + std::to_string(BitIndex) + "]"; 
                    FirstVariable = false;
                }else{
                    Result += " & ~" + ModuleName + "_in[" + std::to_string(BitIndex) + "]"; 
                }
            }
        }
            
        Result += ")";
    }

    Result += ";";
    return Result;
}

std::vector<ImpeccableCircuitsII::Module> ImpeccableCircuitsII::ConvertLutToModule(ImpeccableCircuitsII::LookupTable& Lut, std::string ModuleName){
    std::cout << "Convert LUT representation to module \"" << ModuleName << "\"..." << std::flush;

    unsigned int CoordinateFunctionIndex = 0, BitIndex = 0, InputIndex = 0;
    std::vector<int> Inputs(Lut.InputWidth, 0);
    std::vector<ImpeccableCircuitsII::Module> Result(Lut.SumOfProducts.size());
    std::string Instruction;

    // Coordinate function monomial variable
    // Get the number of inputs and their representation inside the modules
    for (CoordinateFunctionIndex = 0; CoordinateFunctionIndex < Lut.SumOfProducts.size(); CoordinateFunctionIndex++){
        if (Lut.SumOfProducts.size() == 1){
            Result.at(CoordinateFunctionIndex).ModuleName = ModuleName;
        }else{
            Result.at(CoordinateFunctionIndex).ModuleName = ModuleName + std::to_string(CoordinateFunctionIndex);
        }

        Result.at(CoordinateFunctionIndex).InstanceName = Result.at(CoordinateFunctionIndex).ModuleName + "_inst";
        std::fill(Inputs.begin(), Inputs.end(), 0);

        // Get all inputs of the module
        for (InputIndex = 0; InputIndex < Lut.SumOfProducts.at(CoordinateFunctionIndex).size(); InputIndex++){
            for (BitIndex = 0; BitIndex < Lut.SumOfProducts.at(CoordinateFunctionIndex).at(InputIndex).size(); BitIndex++){
                if (Lut.SumOfProducts.at(CoordinateFunctionIndex).at(InputIndex).at(BitIndex) == 1 || Lut.SumOfProducts.at(CoordinateFunctionIndex).at(InputIndex).at(BitIndex) == 0){
                    Inputs.at(BitIndex) = 1;
                }
            }
        }

        Instruction = ImpeccableCircuitsII::PrintSumOfProducts(Lut, ModuleName, CoordinateFunctionIndex);
        Result.at(CoordinateFunctionIndex).Instructions.push_back(Instruction);

        for (InputIndex = 0; InputIndex < Lut.InputWidth; InputIndex++){
            if (Inputs.at(InputIndex)){
                Result.at(CoordinateFunctionIndex).Inputs.emplace_back(ModuleName + "_in[" + std::to_string(InputIndex) + "]");
            }
        }     

        Result.at(CoordinateFunctionIndex).Outputs.emplace_back(ModuleName + "_out[" + std::to_string(CoordinateFunctionIndex) + "]");
    }  

    std::cout << "PASSED" << std::endl;
    return Result;
}

void ImpeccableCircuitsII::InsertXor(ImpeccableCircuitsII::Anf& X, ImpeccableCircuitsII::Anf& Y, ImpeccableCircuitsII::Anf& Z){
    auto it1 = X.Monomials.begin();
    auto it2 = Y.Monomials.begin();

    // Search for all monomials that occur twice
    while(it1 != X.Monomials.end() && it2 != Y.Monomials.end()){
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
    for(auto &Monomial : X.Monomials){
        if(Monomial.second){
            Z.Monomials.insert(Monomial);
        }else{
            Monomial.second = true;
        }
    }

    for(auto &Monomial : Y.Monomials){
        if(Monomial.second){
            Z.Monomials.insert(Monomial);
        }else{
            Monomial.second = true;
        }
    }

    // Compute parity
    Z.Parity ^= X.Parity ^ Y.Parity;
}

void ImpeccableCircuitsII::InsertXorSmall(std::map<uint2048_t, bool>& X, std::map<uint2048_t, bool>& Y, std::map<uint2048_t, bool>& Z){
    auto it1 = X.begin();
    auto it2 = Y.begin();

    // Search for all monomials that occur twice
    while(it1 != X.end() && it2 != Y.end()){
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
    for(auto &Monomial : X){
        if(Monomial.second){
           Z.insert(Monomial);
        }else{
            Monomial.second = true;
        }
    }

    for(auto &Monomial : Y){
        if(Monomial.second){
            Z.insert(Monomial);
        }else{
            Monomial.second = true;
        }
    }
}

// Performs an and gate on two inputs and xors the result to z
void ImpeccableCircuitsII::InsertAnd(ImpeccableCircuitsII::Anf& X, ImpeccableCircuitsII::Anf& Y, ImpeccableCircuitsII::Anf& Z){
    std::map<uint2048_t, bool> mon, px;
    uint2048_t mon_xy;

    // Loop over all monomials from both inputs
    if(!X.Parity && !Y.Parity){
        for(auto &mon_x : X.Monomials){
            for (auto &mon_y : Y.Monomials){
                // Merge two monomials together
                mon_xy = mon_x.first | mon_y.first;
                // Push new monomial to list
                auto it = Z.Monomials.insert({mon_xy,true});
                // If the key already exists delete the key
                if(!it.second){Z.Monomials.erase(it.first);}
            }
        }
    }else{
        for(auto mon_x : X.Monomials){
            for (auto mon_y : Y.Monomials){
                // Merge two monomials together
                mon_xy = mon_x.first | mon_y.first;
                // Push new monomial to list
                auto it = mon.insert({mon_xy,true});
                // If the key already exists delete the key
                if(!it.second){mon.erase(it.first);}
            }
        }

        if(X.Parity && Y.Parity){
            ImpeccableCircuitsII::InsertXorSmall(Y.Monomials, mon, px);
            ImpeccableCircuitsII::InsertXorSmall(X.Monomials, px, Z.Monomials);
        }else if(X.Parity && !Y.Parity){
            ImpeccableCircuitsII::InsertXorSmall(Y.Monomials, mon, Z.Monomials);
        }else{
            ImpeccableCircuitsII::InsertXorSmall(X.Monomials, mon, Z.Monomials);
        }
    }

    // Add the inversion bit result of the and gate
    Z.Parity ^=  X.Parity & Y.Parity;
}

std::string ImpeccableCircuitsII::PrintAnf(std::string NameOfOutput, ImpeccableCircuitsII::Anf& X, std::map<unsigned int, std::string>& IndexToName){
    std::string Result = "assign " + NameOfOutput + " = ";
    bool FirstVariable = true;

    for (auto& Monomial : X.Monomials){
        FirstVariable = true;
        for (unsigned int TmpIndex = 0; TmpIndex < 2048; TmpIndex++){
            if (boost::multiprecision::bit_test(Monomial.first.data_[TmpIndex / 1024], TmpIndex % 1024)){
                if (FirstVariable){
                    Result += "(" + IndexToName[TmpIndex];
                    FirstVariable = false;
                }else{
                    Result += " & " + IndexToName[TmpIndex];
                }
            }
        }

        Result += ") ^ ";
    }

    if (X.Parity){
        Result += "1'b1;";
    }else{
        Result += "1'b0;";
    }

    return Result;
}

void ImpeccableCircuitsII::SetLinearFaultPropagation(std::map<std::string, ImpeccableCircuitsII::Anf>& SignalToAnf, std::map<unsigned int, std::string>& IndexToAttribute){
    unsigned int Index, SetBits;

    for (auto& Anfs : SignalToAnf){
        Anfs.second.Linear = 1;

        for (auto& Monomial : Anfs.second.Monomials){
            SetBits = 0;

            for (Index = 0; Index < 2048; Index++){
                if (boost::multiprecision::bit_test(Monomial.first.data_[Index / 1024], Index % 1024)){
                    if (IndexToAttribute[Index] != "reset"){
                        SetBits++;
                    }
                }
            }  

            if (SetBits > 1){
                Anfs.second.Linear = false;
                break;
            }
        }
    }
}

void ImpeccableCircuitsII::BackpropagateSignal(CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, std::vector<ImpeccableCircuitsII::Module>& Round, int Index, std::set<unsigned int>& Considered, std::queue<unsigned int>& Outputs, std::queue<unsigned int>& Intermediates){
    std::string SignalName;
    int SignalIndex, TmpIndex;

    for (int InputIndex = 0; InputIndex < SecureCombCircuit->Cells[Index]->NumberOfInputs; InputIndex++){  
        SignalIndex = SecureCombCircuit->Cells[Index]->Inputs[InputIndex]; 
        SignalName = SecureCombCircuit->Signals[SignalIndex]->Name;

        if (SignalName != "1'b0" && SignalName != "1'b1"){
            ImpeccableCircuitsII::Signal Signal(SignalName);
            
            if (ImpeccableCircuitsII::FindPrimaryInput(SecureCombCircuit, SignalName) != -1){        
                if (std::find(Round.back().Inputs.begin(), Round.back().Inputs.end(), Signal) == Round.back().Inputs.end()){
                    Round.back().Inputs.emplace_back(Signal);
                    TmpIndex = ImpeccableCircuitsII::FindPrimaryInput(Circuit, SignalName);

                    if (TmpIndex != -1){ 
                        Round.back().Inputs.back().PrimaryInput = true;

                        // Set the input and output attribute according to the primary input
                        Round.back().Inputs.back().Annotation = Circuit->Signals[Circuit->Inputs[TmpIndex]]->Attribute;
                                    
                        if (Round.back().Inputs.back().Annotation.find("secure") != std::string::npos){
                            Round.back().Inputs.back().Annotation = "secure";
                            Round.back().Outputs.back().Annotation = "secure";
                        }
                    }
                }
            }else if (!strcmp(SecureCombCircuit->Signals[SignalIndex]->Attribute, "layer")){
                if (std::find(Round.back().Inputs.begin(), Round.back().Inputs.end(), Signal) == Round.back().Inputs.end()){
                    Round.back().Inputs.emplace_back(Signal);
                }

                if (Considered.find(SignalIndex) == Considered.end()){
                    Outputs.push(SignalIndex);
                    Considered.insert(SignalIndex);
                }
            }else{
                if (std::find(Round.back().Intermediates.begin(), Round.back().Intermediates.end(), Signal) == Round.back().Intermediates.end()){
                    Round.back().Intermediates.emplace_back(Signal);
                    Intermediates.push(SignalIndex);
                }            
            }
        }
    }
}

void ImpeccableCircuitsII::BackpropagateInstructions(LibraryStruct* Library, CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, std::vector<ImpeccableCircuitsII::Module>& Round, int Index, unsigned int SignalIndex){
    std::vector<std::string> Operands(SecureCombCircuit->Cells[Index]->NumberOfInputs);
    std::string Expr = Library->CellTypes[SecureCombCircuit->Cells[Index]->Type]->CustomName;
    std::string SignalName = SecureCombCircuit->Signals[SignalIndex]->Name;
    std::string Instr = "assign " + SignalName + " = ";
    int InputIndex;

    for (InputIndex = 0; InputIndex < SecureCombCircuit->Cells[Index]->NumberOfInputs; InputIndex++){
        Operands.at(InputIndex) = SecureCombCircuit->Signals[SecureCombCircuit->Cells[Index]->Inputs[InputIndex]]->Name;
    }

    // Print the computation of the cell
    if (Expr == "not"){
        if (Operands.at(0) == "1'b0"){
            Instr += "1'b1;";
        }else if (Operands.at(0) == "1'b1") {
            Instr += "1'b0;";
        }else{
            Instr += "~(" + Operands.at(0) + ");";
        }
    }else if (Expr == "and"){
        if ((Operands.at(0) == "1'b0") || (Operands.at(1) == "1'b0")){
            Instr += "1'b0;";
        }else if ((Operands.at(0) == "1'b1") && (Operands.at(1) == "1'b1")){
            Instr += "1'b1;";
        }else if (Operands.at(0) == "1'b1"){
            Instr += Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b1"){
            Instr += Operands.at(0) + ";";
        }else{
            Instr += Operands.at(0) + " & " + Operands.at(1) + ";";
        }
    }else if (Expr == "nand"){
        if ((Operands.at(0) == "1'b0") || (Operands.at(1) == "1'b0")){
            Instr += "1'b1;";
        }else if ((Operands.at(0) == "1'b1") && (Operands.at(1) == "1'b1")){
            Instr += "1'b0;";
        }else if (Operands.at(0) == "1'b1"){
            Instr += "~" + Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b1"){
            Instr += "~" + Operands.at(0) + ";";
        }else{
            Instr += "~(" + Operands.at(0) + " & " + Operands.at(1) + ");";
        }     
    }else if (Expr == "or"){
        if ((Operands.at(0) == "1'b0") && (Operands.at(1) == "1'b0")){
            Instr += "1'b0;";
        }else if ((Operands.at(0) == "1'b1") || (Operands.at(1) == "1'b1")){
            Instr += "1'b1;";
        }else if (Operands.at(0) == "1'b0"){
            Instr += Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b0"){
            Instr += Operands.at(0) + ";";
        }else{
            Instr += Operands.at(0) + " | " + Operands.at(1) + ";";
        }
    }else if (Expr == "nor"){
        if ((Operands.at(0) == "1'b0") && (Operands.at(1) == "1'b0")){
            Instr += "1'b1;";
        }else if ((Operands.at(0) == "1'b1") || (Operands.at(1) == "1'b1")){
            Instr += "1'b0;";
        }else if (Operands.at(0) == "1'b0"){
            Instr += "~" + Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b0"){
            Instr += "~" + Operands.at(0) + ";";
        }else{
            Instr += "~(" + Operands.at(0) + " | " + Operands.at(1) + ");";
        }  
    }else if (Expr == "xor"){
        if ((Operands.at(0) == "1'b0") && (Operands.at(1) == "1'b0")){
            Instr += "1'b0;";
        }else if ((Operands.at(0) == "1'b1") && (Operands.at(1) == "1'b1")){
            Instr += "1'b0;";
        }else if ((Operands.at(0) == "1'b0") && (Operands.at(1) == "1'b1")){
            Instr += "1'b1;";
        }else if ((Operands.at(0) == "1'b1") && (Operands.at(1) == "1'b0")){
            Instr += "1'b1;";
        }else if (Operands.at(0) == "1'b0"){
            Instr += Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b0"){
            Instr += Operands.at(0) + ";";
        }else if (Operands.at(0) == "1'b1"){
            Instr += "~" + Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b1"){
            Instr += "~" + Operands.at(0) + ";";
        }else{
            Instr += Operands.at(0) + " ^ " + Operands.at(1) + ";";
        }
    }else if (Expr == "xnor"){
        if ((Operands.at(0) == "1'b0") && (Operands.at(1) == "1'b0")){
            Instr += "1'b1;";
        }else if ((Operands.at(0) == "1'b1") && (Operands.at(1) == "1'b1")){
            Instr += "1'b1;";
        }else if ((Operands.at(0) == "1'b0") && (Operands.at(1) == "1'b1")){
            Instr += "1'b0;";
        }else if ((Operands.at(0) == "1'b1") && (Operands.at(1) == "1'b0")){
            Instr += "1'b0;";
        }else if (Operands.at(0) == "1'b1"){
            Instr += Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b1"){
            Instr += Operands.at(0) + ";";
        }else if (Operands.at(0) == "1'b0"){
            Instr += "~" + Operands.at(1) + ";";
        }else if (Operands.at(1) == "1'b0"){
            Instr += "~" + Operands.at(0) + ";";
        }else{
            Instr += "~(" + Operands.at(0) + " ^ " + Operands.at(1) + ");";
        }
    }else if (Expr == "mux"){
        if ((Operands.at(0) == "1'b0")){
            Instr += Operands.at(2) + ";";
        }else if ((Operands.at(0) == "1'b1")){
            Instr += Operands.at(1) + ";";
        }else if ((Operands.at(1) == "1'b0") && (Operands.at(2) == "1'b0")){
            Instr += "1'b0;";
        }else if ((Operands.at(1) == "1'b1") && (Operands.at(2) == "1'b1")){
            Instr += "1'b1;";
        }else if (Operands.at(1) == "1'b0"){
            Instr += Operands.at(0) + " & " + Operands.at(2) + ";";
        }else if (Operands.at(1) == "1'b1"){
            Instr += "~(" + Operands.at(0) + " & " + "~" + Operands.at(2) + ");";
        }else if (Operands.at(2) == "1'b0"){
            Instr += "~" + Operands.at(0) + " & " + Operands.at(1) + ";";
        }else if (Operands.at(2) == "1'b1"){
            Instr += "~(~" + Operands.at(0) + " & " + "~" + Operands.at(1) + ");";
        }else{
            Instr += Operands.at(0) + " ? " + Operands.at(2) + " : " + Operands.at(1) + ";";
        }
    }else{
        std::cout << "[ERROR] Gate " << Expr << " is not supported!" << std::endl;
        getchar();
    }

    Round.back().Instructions.push_back(Instr);    
}

void ImpeccableCircuitsII::GenerateCombinationalModules(LibraryStruct* Library, CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, std::vector<ImpeccableCircuitsII::Module>& Round, std::string ModuleName){
    int OutputIndex;
    ImpeccableCircuitsII::Module EmptyModule;
    std::string SignalName;

    // Stores the indices of outputs and intermediates from the combinational logic
    std::queue<unsigned int> Outputs, Intermediates;

    // Stores all outputs which are already considered in order to avoid duplicates
    std::set<unsigned int> Considered;

    for (OutputIndex = 0; OutputIndex < SecureCombCircuit->NumberOfOutputs; OutputIndex++){
        Outputs.push(SecureCombCircuit->Outputs[OutputIndex]);
        Considered.insert(SecureCombCircuit->Outputs[OutputIndex]);
    }

    // Continue as long as signals must be backpropagated
    while (!Outputs.empty()){
        Round.push_back(EmptyModule);
        // Create a new module for each output signal of the combinational logic
        Round.back().ModuleName = ModuleName + std::to_string(Round.size() - 1);
        Round.back().InstanceName = Round.back().ModuleName + "_inst"; 

        // Assign the output signal to the generated module
        SignalName = SecureCombCircuit->Signals[Outputs.front()]->Name;
        Round.back().Outputs.emplace_back(SignalName);

        Intermediates.push(Outputs.front());

        while (!Intermediates.empty()){
            // Get the cell that outputs the intermediate signal
            int CellIndex = SecureCombCircuit->Signals[Intermediates.front()]->Output;
            ImpeccableCircuitsII::BackpropagateSignal(Circuit, SecureCombCircuit, Round, CellIndex, Considered, Outputs, Intermediates);
            ImpeccableCircuitsII::BackpropagateInstructions(Library, Circuit, SecureCombCircuit, Round, CellIndex, Intermediates.front());
            Intermediates.pop();
        }

        Outputs.pop();
    }
}

void ImpeccableCircuitsII::ConnectSignalsToCombinationalLogic(CircuitStruct* Circuit, std::vector<ImpeccableCircuitsII::Module>& Round, std::string ModuleName){
    std::string SignalName;
    ImpeccableCircuitsII::Module EmptyModule;
    int reg_index, input_index;

    // Check for primary inputs which are not given to the combinational logic but to the register stage
    for (reg_index = 0; reg_index < Circuit->NumberOfRegs; reg_index++){
        for (input_index = 0; input_index < Circuit->Cells[Circuit->Regs[reg_index]]->NumberOfInputs; input_index++){
            if (Circuit->ClockSignalIndex != Circuit->Cells[Circuit->Regs[reg_index]]->Inputs[input_index]){
                SignalName = Circuit->Signals[Circuit->Cells[Circuit->Regs[reg_index]]->Inputs[input_index]]->Name;

                // A primary input which is directly given to a register should first pass the combinational logic
                // Hence, all primary inputs are only inputs of the combinational logic
                if (ImpeccableCircuitsII::FindPrimaryInput(Circuit, SignalName) != -1){
                    Round.push_back(EmptyModule);
                    Round.back().ModuleName = ModuleName + std::to_string(Round.size() - 1);
                    Round.back().InstanceName = Round.back().ModuleName + "_inst"; 
                    Round.back().Inputs.push_back(SignalName);
                    Round.back().Inputs.back().Annotation = Circuit->Signals[Circuit->Cells[Circuit->Regs[reg_index]]->Inputs[input_index]]->Attribute;
                    Round.back().Inputs.back().PrimaryInput = true;
                    Round.back().Outputs.push_back(SignalName);
                    Round.back().Instructions.push_back("assign y = x;");
                }

                SignalName = Circuit->Signals[Circuit->Cells[Circuit->Regs[reg_index]]->Outputs[0]]->Name;

                // A register output which is given to another register should first pass the combiantional logic
                // Hence, all signals will be corrected after the round function
                if (ImpeccableCircuitsII::FindRegisterInput(Circuit, SignalName) != -1){
                    Round.push_back(EmptyModule);
                    Round.back().ModuleName = ModuleName + std::to_string(Round.size() - 1);
                    Round.back().InstanceName = Round.back().ModuleName + "_inst"; 
                    Round.back().Inputs.push_back(SignalName);
                    Round.back().Outputs.push_back(SignalName);
                    Round.back().Instructions.push_back("assign y = x;");
                }
            }
        }
    }
}

void ImpeccableCircuitsII::ConnectPrimaryOutputsToRegisters(CircuitStruct* Circuit, std::vector<ImpeccableCircuitsII::Module>& Round, std::vector<ImpeccableCircuitsII::Module>& Register){
    std::string SignalName;
    ImpeccableCircuitsII::Module EmptyModule;
   
    // All primary outputs are taken after the register stage
    // Hence, if a primary output is no register output, we add a wire thorugh the register stage
    for (size_t Index = 0; Index < Round.size(); Index++){
        SignalName = Round.at(Index).Outputs.back().GetName();

        // Check if the signal is a primary output but no register output
        if ((ImpeccableCircuitsII::FindPrimaryOutput(Circuit, SignalName) != -1) && (ImpeccableCircuitsII::FindRegisterOutput(Circuit, SignalName) == -1)){
            Register.push_back(EmptyModule);
            Register.back().Inputs.push_back(Round.at(Index).Outputs.back());
            Register.back().Outputs.push_back(Round.at(Index).Outputs.back());
            Register.back().Outputs.back().PrimaryOutput = true;
        }
    }
}

void ImpeccableCircuitsII::AddPseudoRegistersBetweenLayers(CircuitStruct* Circuit, std::vector<ImpeccableCircuitsII::Module>& Round, std::vector<ImpeccableCircuitsII::Module>& Register){
    int OutputIndex;
    ImpeccableCircuitsII::Module EmptyModule;

    for (size_t Index = 0; Index < Round.size(); Index++){
        OutputIndex = ImpeccableCircuitsII::FindPrimaryOutput(Circuit, Round.at(Index).Outputs.back().GetName());

        if ((OutputIndex == -1) || !strcmp(Circuit->Signals[Circuit->Outputs[OutputIndex]]->Attribute, "layer")){
            Register.push_back(EmptyModule);
            Register.back().Inputs.push_back(Round.at(Index).Outputs.back());
            Register.back().Outputs.push_back(Round.at(Index).Outputs.back());            
        }
    }
}

void ImpeccableCircuitsII::AddRealRegisters(CircuitStruct* Circuit, std::vector<ImpeccableCircuitsII::Module>& Register){
    ImpeccableCircuitsII::Module EmptyModule;
    std::string SignalName;
    int input_index, reg_index;

    for (reg_index = 0; reg_index < Circuit->NumberOfRegs; reg_index++){
        Register.push_back(EmptyModule);

        for (input_index = 0; input_index < Circuit->Cells[Circuit->Regs[reg_index]]->NumberOfInputs; input_index++){
            // Ignore the clock signal
            if (Circuit->ClockSignalIndex != Circuit->Cells[Circuit->Regs[reg_index]]->Inputs[input_index]){
                SignalName = Circuit->Signals[Circuit->Cells[Circuit->Regs[reg_index]]->Inputs[input_index]]->Name;
                Register.back().Inputs.push_back(SignalName);
            }
        }

        SignalName = Circuit->Signals[Circuit->Cells[Circuit->Regs[reg_index]]->Outputs[0]]->Name;
        Register.back().Outputs.push_back(SignalName);

        // Set the primary output flag on register outputs
        if (ImpeccableCircuitsII::FindPrimaryOutput(Circuit, SignalName) != -1){
            Register.back().Outputs.back().PrimaryOutput = true;  
        }
    }
}

void ImpeccableCircuitsII::PropagateLayerDepth(CircuitStruct* Circuit, std::vector<ImpeccableCircuitsII::Module>& Round){
    size_t Index, InputIndex, OutputIndex;
    bool Working = true;

    // All combinational inputs have zero depth
    for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
        for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
            if (ImpeccableCircuitsII::FindPrimaryInput(Circuit, Round.at(OutputIndex).Inputs.at(InputIndex).GetName()) != -1){
                Round.at(OutputIndex).Inputs.at(InputIndex).Depth = 0;
            }
        }
    }
    
    while (Working){ 
        Working = false;
        for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
            for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
                if ((Round.at(OutputIndex).Inputs.at(InputIndex).Depth + 1) > Round.at(OutputIndex).Outputs.back().Depth){
                    Round.at(OutputIndex).Outputs.back().Depth = Round.at(OutputIndex).Inputs.at(InputIndex).Depth + 1;
                    Working = true;
                }
            }
        }

        for (Index = 0; Index < Round.size(); Index++){
            for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
                for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
                    if (Round.at(Index).Outputs.back().GetName() == Round.at(OutputIndex).Inputs.at(InputIndex).GetName()){
                        if (Round.at(OutputIndex).Inputs.at(InputIndex).Depth != Round.at(Index).Outputs.back().Depth){
                            Round.at(OutputIndex).Inputs.at(InputIndex).Depth = Round.at(Index).Outputs.back().Depth;
                            Working = true;
                        }
                    }
                }
            }
        }
    }
}

void ImpeccableCircuitsII::PropagateAnnotations(std::vector<ImpeccableCircuitsII::Module>& Round, std::vector<ImpeccableCircuitsII::Module>& Register){
    size_t InputIndex, OutputIndex, RegisterIndex;
    bool Working = true;

    while (Working){
        Working = false;

        // Propagate secure signals from the round function inputs to the round function outputs
        for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
            if (Round.at(OutputIndex).Outputs.back().Annotation != "secure"){
                for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
                    if (Round.at(OutputIndex).Inputs.at(InputIndex).Annotation == "secure"){
                        Round.at(OutputIndex).Outputs.back().Annotation = "secure";
                        Working = true;
                        break;
                    }
                }
            }
        }

        // Propagate secure signals from the round output to the register inputs
        for (RegisterIndex = 0; RegisterIndex < Register.size(); RegisterIndex++){
            for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
                if (Register.at(RegisterIndex).Inputs.back().GetName() == Round.at(OutputIndex).Outputs.back().GetName()){
                    if (Register.at(RegisterIndex).Inputs.back().Annotation != Round.at(OutputIndex).Outputs.back().Annotation || Register.at(RegisterIndex).Outputs.back().Annotation != Round.at(OutputIndex).Outputs.back().Annotation){
                        Register.at(RegisterIndex).Inputs.back().Annotation = Round.at(OutputIndex).Outputs.back().Annotation;
                        Register.at(RegisterIndex).Outputs.back().Annotation = Round.at(OutputIndex).Outputs.back().Annotation;
                        Working = true;
                        break;
                    }
                }
            } 
        }

        // Propagate secure signals from the register outputs to the round function inputs
        for (RegisterIndex = 0; RegisterIndex < Register.size(); RegisterIndex++){
            for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
                for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
                    if (Register.at(RegisterIndex).Outputs.back().GetName() == Round.at(OutputIndex).Inputs.at(InputIndex).GetName()){
                        if (Round.at(OutputIndex).Inputs.at(InputIndex).Annotation != Register.at(RegisterIndex).Outputs.back().Annotation){
                            Round.at(OutputIndex).Inputs.at(InputIndex).Annotation = Register.at(RegisterIndex).Outputs.back().Annotation;
                            Working = true;
                            break;
                        }
                    }
                }
            }
        }
    }
}

void ImpeccableCircuitsII::PrepareAnfOfInputs(CircuitStruct* Circuit, std::vector<ImpeccableCircuitsII::Module>& Round, std::map<std::string, ImpeccableCircuitsII::Anf>& SignalToAnf, std::map<unsigned int, std::string>& IndexToName, std::map<unsigned int, std::string>& IndexToAttribute){
    ImpeccableCircuitsII::Anf Anf;
    std::string SignalName, SignalAttribute;
    uint2048_t Monomial;
    Monomial.data_[0] = 1;

    SignalToAnf["1'b0"] = Anf;
    SignalToAnf["1'b1"] = Anf;
    SignalToAnf["1'b1"].Parity = 1;

    for (int Index = 0; Index < Circuit->NumberOfInputs; Index++){
        SignalName = Circuit->Signals[Circuit->Inputs[Index]]->Name;
        SignalAttribute = Circuit->Signals[Circuit->Inputs[Index]]->Attribute;

        if (SignalAttribute == "control"){
            SignalAttribute = "reset";
        }

        if (SignalToAnf.find(SignalName) == SignalToAnf.end()){
            IndexToName.insert({IndexToName.size(), SignalName});
            IndexToAttribute.insert({IndexToAttribute.size(), SignalAttribute});
            SignalToAnf[SignalName] = Anf;
            SignalToAnf[SignalName].Monomials.insert({Monomial,true});
            
            if (boost::multiprecision::bit_test(Monomial.data_[0], 1023)){
                Monomial.data_[1] = 1;
                Monomial.data_[0] = 0;
            }else{
                if (Monomial.data_[1] == 0){
                    Monomial.data_[0] <<= 1;
                }else{
                    Monomial.data_[1] <<= 1;
                }
            }
        }
    }  

    for (size_t Index = 0; Index < Round.size(); Index++){
        SignalName = Round.at(Index).Outputs.back().GetName();
        SignalAttribute = Round.at(Index).Outputs.back().Annotation;

        if (ImpeccableCircuitsII::FindPrimaryOutput(Circuit, SignalName) == -1){
            if (SignalToAnf.find(SignalName) == SignalToAnf.end()){
                IndexToName.insert({IndexToName.size(), SignalName});
                IndexToAttribute.insert({IndexToAttribute.size(), SignalAttribute});
                SignalToAnf[SignalName] = Anf;
                SignalToAnf[SignalName].Monomials.insert({Monomial,true});
                
                if (boost::multiprecision::bit_test(Monomial.data_[0], 1023)){
                    Monomial.data_[1] = 1;
                    Monomial.data_[0] = 0;
                }else{
                    if (Monomial.data_[1] == 0){
                        Monomial.data_[0] <<= 1;
                    }else{
                        Monomial.data_[1] <<= 1;
                    }
                }
            }            
        }
    }
}

void ImpeccableCircuitsII::ComputeAnfs(LibraryStruct* Library, CircuitStruct* Circuit, std::map<std::string, ImpeccableCircuitsII::Anf>& SignalToAnf){
    int CellIndex;
    std::string Expr, InputName0, InputName1, InputName2, SignalName;    
    std::map<std::string, ImpeccableCircuitsII::Anf> TmpSignalToAnf;

    for (short DepthIndex = 0; DepthIndex <= Circuit->MaxDepth; DepthIndex++){
        for (CellIndex = 0; CellIndex < Circuit->NumberOfCellsInDepth[DepthIndex]; CellIndex++){
            ImpeccableCircuitsII::Anf Anf, Tmp1, Tmp2;
            SignalName = Circuit->Signals[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Outputs[0]]->Name;
            Expr = Library->CellTypes[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Type]->CustomName;
            InputName0 = Circuit->Signals[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Inputs[0]]->Name;

            if(Expr == "nand" || Expr == "nor" || Expr == "xnor" || Expr == "not"){Anf.Parity = 1;}
            
            if(Expr == "not"){
                Anf.Monomials = SignalToAnf[InputName0].Monomials;
                Anf.Parity ^= SignalToAnf[InputName0].Parity;
            }else if(Expr == "xor" || Expr == "xnor"){
                InputName1 = Circuit->Signals[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Inputs[1]]->Name;
                ImpeccableCircuitsII::InsertXor(SignalToAnf[InputName0], SignalToAnf[InputName1], Anf);
            } else if (Expr == "and" || Expr == "nand"){
                InputName1 = Circuit->Signals[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Inputs[1]]->Name;
                ImpeccableCircuitsII::InsertAnd(SignalToAnf[InputName0], SignalToAnf[InputName1], Anf);
            } else if(Expr == "or" || Expr == "nor"){
                InputName1 = Circuit->Signals[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Inputs[1]]->Name;
                // (x or y) = ~(~a and ~b)
                SignalToAnf[InputName0].Parity ^= 1;
                SignalToAnf[InputName1].Parity ^= 1;
                ImpeccableCircuitsII::InsertAnd(SignalToAnf[InputName0], SignalToAnf[InputName1], Anf);
                SignalToAnf[InputName0].Parity ^= 1;
                SignalToAnf[InputName1].Parity ^= 1;
                Anf.Parity ^= 1;
            } else if (Expr == "mux"){
                InputName1 = Circuit->Signals[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Inputs[1]]->Name;
                InputName2 = Circuit->Signals[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Inputs[2]]->Name;
                ImpeccableCircuitsII::InsertXor(SignalToAnf[InputName1], SignalToAnf[InputName2], Tmp1);
                ImpeccableCircuitsII::InsertAnd(Tmp1, SignalToAnf[InputName0], Tmp2);
                ImpeccableCircuitsII::InsertXor(Tmp2, SignalToAnf[InputName1], Anf);
            } else {
                std::cout << "[ERROR] Gate " << Expr << " is not supported!" << std::endl;
            }

            if (SignalToAnf.find(SignalName) == SignalToAnf.end()){
                SignalToAnf[SignalName] = Anf;
            }else{
                TmpSignalToAnf[SignalName] = Anf;
            }
        }
    }

    for(auto& AnfSignals : TmpSignalToAnf){
        SignalToAnf[AnfSignals.first] = AnfSignals.second;
    }
}

void ImpeccableCircuitsII::ApplyLinearity(CircuitStruct* Circuit, std::vector<ImpeccableCircuitsII::Module>& Round, std::vector<ImpeccableCircuitsII::Module>& Register, std::map<std::string, ImpeccableCircuitsII::Anf>& SignalToAnf){
    bool LinearInput;
    size_t InputIndex, OutputIndex, TmpIndex;
    std::queue<std::string> SignalNames;
    std::vector<std::string> Considered;

    // Check which functions are linear
    for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
        if (Round.at(OutputIndex).Outputs.back().Annotation == "control"){
            Round.at(OutputIndex).Outputs.back().Linear = 0;
        }else{
            Round.at(OutputIndex).Outputs.back().Linear = SignalToAnf.at(Round.at(OutputIndex).Outputs.back().GetName()).Linear;
        }

        // Store all outputs of non-linear functions
        if (!Round.at(OutputIndex).Outputs.back().Linear){
            Considered.push_back(Round.at(OutputIndex).Outputs.back().GetName());
            SignalNames.push(Round.at(OutputIndex).Outputs.back().GetName());
        }
    }

    // Check if the outputs of the non-linear functions propagate
    while (!SignalNames.empty()){
        // Propagate the function output through the register
        // Every function output is a register input
        for (TmpIndex = 0; TmpIndex < Register.size(); TmpIndex++){
            if (Register.at(TmpIndex).Inputs.back() == SignalNames.front()){
                break;
            }
        }

        LinearInput = true;

        // Take the corresponding register output and check if it is the input of only linear functions
        for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
            if (!Round.at(OutputIndex).Outputs.back().Linear && LinearInput){
                for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
                    if (Register.at(TmpIndex).Outputs.back().GetName() == Round.at(OutputIndex).Inputs.at(InputIndex).GetName()){
                        LinearInput = false;
                    }
                }
            }
        }

        // Mark the linear input in all functions
        if (LinearInput){
           for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
                for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){  
                    if (Register.at(TmpIndex).Outputs.back().GetName() == Round.at(OutputIndex).Inputs.at(InputIndex).GetName()){
                        Round.at(OutputIndex).Inputs.at(InputIndex).Linear = 1;
                    }
                }
            }            
        }

        LinearInput = true;

        // We can further propagate output signals which are computed by a linear function with only uncorrected inputs
        for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
            if (Round.at(OutputIndex).Outputs.back().Linear){
                for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){  
                    if (!Round.at(OutputIndex).Inputs.at(InputIndex).Linear && (ImpeccableCircuitsII::FindPrimaryInput(Circuit, Round.at(OutputIndex).Inputs.at(InputIndex).GetName()) == -1)){
                        LinearInput = false;
                        break;
                    }
                }
            }else{
                LinearInput = false;
            }

            if (LinearInput && (std::find(Considered.begin(), Considered.end(), Round.at(OutputIndex).Outputs.back().GetName()) == Considered.end())){
                SignalNames.push(Round.at(OutputIndex).Outputs.back().GetName());
                Considered.push_back(Round.at(OutputIndex).Outputs.back().GetName());
            }   
        }

        SignalNames.pop();  
    }

    for (OutputIndex = 0; OutputIndex < Round.size(); OutputIndex++){
        Round.at(OutputIndex).Outputs.back().Linear = 1;

        // Set all primary inputs as linear (they are fault-free by definition)
        for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
            if (ImpeccableCircuitsII::FindPrimaryInput(Circuit, Round.at(OutputIndex).Inputs.at(InputIndex).GetName()) != -1){
                Round.at(OutputIndex).Inputs.at(InputIndex).Linear = 1;
            }
        }

        for (InputIndex = 0; InputIndex < Round.at(OutputIndex).Inputs.size(); InputIndex++){
            if (!Round.at(OutputIndex).Inputs.at(InputIndex).Linear || Round.at(OutputIndex).Outputs.back().Annotation == "control"){
                Round.at(OutputIndex).Outputs.back().Linear = 0;
            }
        }
    }
}

void ImpeccableCircuitsII::ConvertRoundToModule(LibraryStruct* Library, CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, std::vector<ImpeccableCircuitsII::Module>& Round, std::vector<ImpeccableCircuitsII::Module>& Register, std::string ModuleName, std::map<std::string, ImpeccableCircuitsII::Anf>& SignalToAnf){
    std::cout << "Convert LUT representation to round module(s) \"" << ModuleName << "\"..." << std::flush;
    std::map<unsigned int, std::string> IndexToName, IndexToAttribute;

    ImpeccableCircuitsII::GenerateCombinationalModules(Library, Circuit, SecureCombCircuit, Round, ModuleName);
        std::cout << "done 1" << std::endl;

    ImpeccableCircuitsII::ConnectSignalsToCombinationalLogic(Circuit, Round, ModuleName);
        std::cout << "done 2" << std::endl;

    ImpeccableCircuitsII::ConnectPrimaryOutputsToRegisters(Circuit, Round, Register);
        std::cout << "done 3" << std::endl;

    ImpeccableCircuitsII::AddPseudoRegistersBetweenLayers(SecureCombCircuit, Round, Register);
        std::cout << "done 4" << std::endl;

    ImpeccableCircuitsII::AddRealRegisters(Circuit, Register);
        std::cout << "done 5" << std::endl;

    ImpeccableCircuitsII::PropagateLayerDepth(SecureCombCircuit, Round);
        std::cout << "done 6" << std::endl;

    ImpeccableCircuitsII::PropagateAnnotations(Round, Register);
        std::cout << "done 7" << std::endl;

    ImpeccableCircuitsII::PrepareAnfOfInputs(SecureCombCircuit, Round, SignalToAnf, IndexToName, IndexToAttribute);

    std::cout << "done 8" << std::endl;


    // Start the Computation of ANFs
    if (SignalToAnf.size() > 2048){
        std::cout << "WARNING: AGEFA cannot handle " << SignalToAnf.size() << " > 2048 function inputs..." << std::endl; 
        getchar();
    }else{
        std::cout << "Number of considered function inputs: " << SignalToAnf.size() << "...";
    }

    ImpeccableCircuitsII::ComputeAnfs(Library, SecureCombCircuit, SignalToAnf);
        std::cout << "done 9" << std::endl;

    ImpeccableCircuitsII::SetLinearFaultPropagation(SignalToAnf, IndexToAttribute);
        std::cout << "done 10" << std::endl;

    ImpeccableCircuitsII::ApplyLinearity(Circuit, Round, Register, SignalToAnf); 
    std::cout << "PASSED" << std::endl;  
}