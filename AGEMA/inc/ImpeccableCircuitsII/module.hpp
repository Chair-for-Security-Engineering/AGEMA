#pragma once

#include <queue>
#include <cstring>
#include <set>

#include "ImpeccableCircuitsII/signal.hpp"
#include "ImpeccableCircuitsII/code.hpp"

namespace ImpeccableCircuitsII{
    struct Module{
        std::string ModuleName;
        std::string InstanceName;
        
        std::vector<ImpeccableCircuitsII::Signal> Inputs;
        std::vector<ImpeccableCircuitsII::Signal> Intermediates;
        std::vector<ImpeccableCircuitsII::Signal> Outputs;

        //std::vector<unsigned int> InputIndices;
        std::vector<std::string> Instructions;

        void SetModuleAndInstanceName(std::string, std::string, std::string, unsigned int);
        void PrintHeader(std::ofstream&, bool);
        void PrintBody(std::ofstream&, bool);
        void PrintModule(std::ofstream&, bool, bool);
        std::string PrintInstance();   
    };

    std::string PrintSumOfProducts(ImpeccableCircuitsII::LookupTable&, std::string, unsigned int);
    std::string PrintAlgebraicNormalForm(ImpeccableCircuitsII::LookupTable&, std::string, unsigned int);
    std::string PrintAnf(std::string, ImpeccableCircuitsII::Anf&, std::map<unsigned int, std::string>&);
    void InsertXorSmall(std::map<uint2048_t, bool>&, std::map<uint2048_t, bool>&, std::map<uint2048_t, bool>&);
    void InsertAnd(ImpeccableCircuitsII::Anf&, ImpeccableCircuitsII::Anf&, ImpeccableCircuitsII::Anf&);
    void InsertXor(ImpeccableCircuitsII::Anf&, ImpeccableCircuitsII::Anf&, ImpeccableCircuitsII::Anf&);

    void AddSignal(ImpeccableCircuitsII::Signal&, std::vector<ImpeccableCircuitsII::Signal>&, std::vector<ImpeccableCircuitsII::Signal>&, std::vector<ImpeccableCircuitsII::Signal>&); 
    void AddSignals(std::vector<ImpeccableCircuitsII::Signal>& Signals, std::vector<ImpeccableCircuitsII::Signal>&, std::vector<ImpeccableCircuitsII::Signal>&, std::vector<ImpeccableCircuitsII::Signal>&);   
    void DefinePorts(std::ofstream&, bool, std::vector<ImpeccableCircuitsII::Signal>&, std::string, std::string);

    std::string ReplaceString(std::string, const std::string&, const std::string&);
    void CreateSignalNameMapping(std::vector<ImpeccableCircuitsII::Signal>&, std::string, std::vector<std::pair<std::string, std::string>>&);
    void ReplaceSignalNames(std::vector<ImpeccableCircuitsII::Signal>&, std::vector<ImpeccableCircuitsII::Signal>&, std::vector<ImpeccableCircuitsII::Signal>&, std::vector<std::string>&, std::string, std::string, std::string);
    void PrintModules(std::vector<ImpeccableCircuitsII::Module>&, std::ofstream&, bool, bool);
    void PrintDoneMultiplexer(ImpeccableCircuitsII::ErrorCorrectingCode&, std::ofstream&);
    std::vector<ImpeccableCircuitsII::Module> ConvertLutToModule(ImpeccableCircuitsII::LookupTable&, std::string);
    void BackpropagateSignal(CircuitStruct*, CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, int, std::set<unsigned int>&, std::queue<unsigned int>&, std::queue<unsigned int>&);
    void BackpropagateInstructions(LibraryStruct*, CircuitStruct*, CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, int, unsigned int);
    void GenerateCombinationalModules(LibraryStruct*, CircuitStruct*, CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, std::string);
    void ConnectSignalsToCombinationalLogic(CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, std::string);
    void ConnectPrimaryOutputsToRegisters(CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, std::vector<ImpeccableCircuitsII::Module>&);
    void AddPseudoRegistersBetweenLayers(CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, std::vector<ImpeccableCircuitsII::Module>&);
    void AddRealRegisters(CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&);
    void PropagateLayerDepth(CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&);
    void PropagateAnnotations(std::vector<ImpeccableCircuitsII::Module>&, std::vector<ImpeccableCircuitsII::Module>&);
    void PrepareAnfOfInputs(CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, std::map<std::string, ImpeccableCircuitsII::Anf>&, std::map<unsigned int, std::string>&, std::map<unsigned int, std::string>&);
    void ComputeAnfs(LibraryStruct*, CircuitStruct*, std::map<std::string, ImpeccableCircuitsII::Anf>&);
    void SetLinearFaultPropagation(std::map<std::string, ImpeccableCircuitsII::Anf>&, std::map<unsigned int, std::string>&);
    void ApplyLinearity(CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, std::vector<ImpeccableCircuitsII::Module>&, std::map<std::string, ImpeccableCircuitsII::Anf>&);
    void ConvertRoundToModule(LibraryStruct*, CircuitStruct*, CircuitStruct*, std::vector<ImpeccableCircuitsII::Module>&, std::vector<ImpeccableCircuitsII::Module>&, std::string, std::map<std::string, ImpeccableCircuitsII::Anf>&);
}