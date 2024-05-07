#pragma once

#include <algorithm>
#include <map>
#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>
#include "types.h"

namespace ImpeccableCircuitsII{
    std::string GetSignalName(std::string);
    int GetSignalIndex(std::string, bool&);
    bool NoIndexAndNoConstant(std::string&);
    std::string AppendSignalName(std::string, std::string);
    std::string ExtendWithIndex(std::string);
    void CombineSignals(std::vector<std::string>&, std::map<std::string, int>&);
    std::map<std::string, unsigned int> GetAttributes(std::string);

    int FindRegisterInput(CircuitStruct*, std::string);
    int FindRegisterOutput(CircuitStruct*, std::string);
    int FindPrimaryInput(CircuitStruct*, std::string);
    int FindPrimaryOutput(CircuitStruct*, std::string);
}