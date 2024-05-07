#include "ImpeccableCircuitsII/util.hpp"

std::string ImpeccableCircuitsII::GetSignalName(std::string SignalName){
    size_t IndexStart = SignalName.find('[');

    if (IndexStart != std::string::npos){
        return SignalName.substr(0, IndexStart);
    }else{
        return SignalName;
    }
}

int ImpeccableCircuitsII::GetSignalIndex(std::string SignalName, bool& SignalHasIndex){
    size_t IndexStart = SignalName.find('[');
    size_t IndexEnd = SignalName.find(']');

    SignalHasIndex = (IndexStart != std::string::npos) && (IndexEnd != std::string::npos);

    if (SignalHasIndex){
        return std::stoi(SignalName.substr(IndexStart + 1, IndexEnd - IndexStart - 1));
    }else{
        return 0;
    }
}

bool ImpeccableCircuitsII::NoIndexAndNoConstant(std::string& Text){
    if(Text.find('[') == std::string::npos && Text.find(']') == std::string::npos && Text != "1'b0" && Text != "1'b1"){
        return true;
    }else{
        return false;
    }
}

std::string ImpeccableCircuitsII::ExtendWithIndex(std::string Text){
    std::string Result;

    if (ImpeccableCircuitsII::NoIndexAndNoConstant(Text)){
        Result = Text + "[0]";
    }else{
        Result = Text;
    }

    return Result;
}

std::string ImpeccableCircuitsII::AppendSignalName(std::string Name, std::string Appendix){
    bool SignalHasIndex = false;
    std::string NameWithAppendix = ImpeccableCircuitsII::GetSignalName(Name);
    int Index = ImpeccableCircuitsII::GetSignalIndex(Name, SignalHasIndex);

    // If the signal name is part of a vector, extend the name before the bit index
    if (SignalHasIndex){
        NameWithAppendix += Appendix + "[" + std::to_string(Index) + "]";
    }else{    
        NameWithAppendix += Appendix;
    }

    return NameWithAppendix;
}

void ImpeccableCircuitsII::CombineSignals(std::vector<std::string>& SignalNames, std::map<std::string, int>& NamesWithIndices){
    std::string Name;
    int Index;
    bool SignalHasIndex;

    for (size_t SignalIndex = 0; SignalIndex < SignalNames.size(); SignalIndex++){
        Name = ImpeccableCircuitsII::GetSignalName(SignalNames[SignalIndex]);
        Index = ImpeccableCircuitsII::GetSignalIndex(SignalNames[SignalIndex], SignalHasIndex);

        if (NamesWithIndices.find(Name) == NamesWithIndices.end()){
            NamesWithIndices.insert(std::pair<std::string,int>(Name,Index));
        }else{
            if (SignalHasIndex){
                if (Index > NamesWithIndices[Name]){
                    NamesWithIndices[Name] = Index;
                }
            }
        }
    }
}

std::map<std::string, unsigned int> ImpeccableCircuitsII::GetAttributes(std::string AttributeReportFileName){
    std::map<std::string, unsigned int> Result;
    std::string Design, Object, Type, AttributeName, Value;
    std::vector<std::string> Elements;

    // Attribute file 
    std::ifstream Attributes(AttributeReportFileName);   

    if (Attributes.is_open()){
        std::cout << "Attribute file at " << AttributeReportFileName << " successfully opened." << std::endl; 

        for (std::string Line; std::getline(Attributes, Line);){
            std::stringstream StringStream(Line);

            StringStream >> Design;
            StringStream >> Object;
            StringStream >> Type;
            StringStream >> AttributeName;
            
            if (AttributeName == "share_domain"){
                StringStream >> Value;

                if (Object.find('/') != std::string::npos){
                    std::replace(Object.begin(), Object.end(), '/', '_');
                    //std::replace(Object.begin(), Object.end(), '[', '_');
                    //std::replace(Object.begin(), Object.end(), ']', '_');
                }

                Result.insert({Object, std::stoi(Value)});
            }
        }

        Attributes.close();
    }else{
        std::cout << "No attribute file available at " << AttributeReportFileName << std::endl; 
    }

    return Result;
}

int ImpeccableCircuitsII::FindRegisterInput(CircuitStruct* Circuit, std::string ReferenceName){
    std::string InputName;

    for (int Index = 0; Index < Circuit->NumberOfRegs; Index++){
        InputName = Circuit->Signals[Circuit->Cells[Circuit->Regs[Index]]->Inputs[1]]->Name;

        if (InputName == ReferenceName){
            return Index;
        }
    }

    return -1;
}

int ImpeccableCircuitsII::FindRegisterOutput(CircuitStruct* Circuit, std::string ReferenceName){
    std::string OutputName;

    for (int Index = 0; Index < Circuit->NumberOfRegs; Index++){
        OutputName = Circuit->Signals[Circuit->Cells[Circuit->Regs[Index]]->Outputs[0]]->Name;

        if (OutputName == ReferenceName){
            return Index;
        }
    }

    return -1;
}

int ImpeccableCircuitsII::FindPrimaryInput(CircuitStruct* Circuit, std::string ReferenceName){
    std::string InputName;

    for (int Index = 0; Index < Circuit->NumberOfInputs; Index++){
        InputName = Circuit->Signals[Circuit->Inputs[Index]]->Name;

        if (InputName == ReferenceName){
            return Index;
        }
    }

    return -1;
}

int ImpeccableCircuitsII::FindPrimaryOutput(CircuitStruct* Circuit, std::string ReferenceName){
    std::string OutputName;

    for (int Index = 0; Index < Circuit->NumberOfOutputs; Index++){
        OutputName = Circuit->Signals[Circuit->Outputs[Index]]->Name;

        if (OutputName == ReferenceName){
            return Index;
        }
    }

    return -1;
}