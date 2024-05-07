#include "ImpeccableCircuitsII/signal.hpp"

std::string ImpeccableCircuitsII::GetNameWithoutIndex(std::string& Name){
    size_t IndexStart = Name.find('[');

    if (IndexStart != std::string::npos){
        return Name.substr(0, IndexStart);
    }else{
        return Name;
    }
}

int ImpeccableCircuitsII::GetIndex(std::string& Name){
    size_t IndexStart = Name.find('[');
    size_t IndexEnd = Name.find(']');

    bool SignalHasIndex = (IndexStart != std::string::npos) && (IndexEnd != std::string::npos);

    if (SignalHasIndex){
        return std::stoi(Name.substr(IndexStart + 1, IndexEnd - IndexStart - 1));
    }else{
        return -1;
    }
}

ImpeccableCircuitsII::Signal::Signal(){}

ImpeccableCircuitsII::Signal::Signal(std::string SignalName){    
    Name = GetNameWithoutIndex(SignalName);
    Index = GetIndex(SignalName);
}

void ImpeccableCircuitsII::Signal::SetName(std::string SignalName){    
    Name = GetNameWithoutIndex(SignalName);
    Index = GetIndex(SignalName);
}

std::string ImpeccableCircuitsII::Signal::GetName(){
    std::string Result = Name;

    if (Name == "no_name"){
        std::cout << "ERROR the signal has no name!" << std::endl;
    }

    if (Appendix != "no_appendix"){Result += Appendix;}
    if (ModuleCounter >= 0){Result += "_" + std::to_string(ModuleCounter);}
    if (Index >= 0){Result += "[" + std::to_string(Index) + "]";}

    return Result;
}

bool ImpeccableCircuitsII::Signal::operator==(const Signal& rhs) const{
    return (Name == rhs.Name) && (Index == rhs.Index) && (Appendix == rhs.Appendix) && (ModuleCounter == rhs.ModuleCounter);
}

std::string ImpeccableCircuitsII::PrintSignals(std::vector<ImpeccableCircuitsII::Signal>& Signals){
    std::string Result;

    for (size_t SignalIndex = 0; SignalIndex < Signals.size(); SignalIndex++){
        if (SignalIndex){
            Result += ", " + Signals.at(Signals.size() - SignalIndex - 1).GetName();
        }else{
            Result += Signals.at(Signals.size() - SignalIndex - 1).GetName();
        }
    }

    if (Signals.size() > 1){
        Result = "{" + Result + "}";
    }

    return Result;
}
