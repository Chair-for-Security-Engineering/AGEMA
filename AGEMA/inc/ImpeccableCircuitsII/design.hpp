#pragma once

#include "ImpeccableCircuitsII/module.hpp"

namespace ImpeccableCircuitsII{
    struct Design{
        // Single modules
        std::vector<ImpeccableCircuitsII::Module> Xor;
        std::vector<ImpeccableCircuitsII::Module> F;
        std::vector<ImpeccableCircuitsII::Module> InvF;
        std::vector<ImpeccableCircuitsII::Module> Sd1;
        std::vector<ImpeccableCircuitsII::Module> Sd2;
        std::vector<ImpeccableCircuitsII::Module> R;
        std::vector<ImpeccableCircuitsII::Module> Reg;

        ImpeccableCircuitsII::Module InF;
        ImpeccableCircuitsII::Module Fx;
        ImpeccableCircuitsII::Module R1_ind;
        ImpeccableCircuitsII::Module R2_ind;       
        ImpeccableCircuitsII::Module Reg1;
        ImpeccableCircuitsII::Module Reg2;
        ImpeccableCircuitsII::Module Muxtree;

        std::map<std::string, ImpeccableCircuitsII::Anf> SignalToAnf;

        bool Decomposed;
        unsigned int RedundandDoneSignal;

        Design(LibraryStruct*, CircuitStruct*, CircuitStruct*, ImpeccableCircuitsII::ErrorCorrectingCode&, bool);
        void PrintCodes(std::string&, std::string&, bool);
    };

    std::vector<ImpeccableCircuitsII::Module> CombineTwoLayersIndependently(std::vector<ImpeccableCircuitsII::Module>&, std::vector<ImpeccableCircuitsII::Module>&, std::string);
    void PrintRegister(std::ofstream&);
    void PrintMultiplexer(std::ofstream&, std::vector<ImpeccableCircuitsII::Signal>&, int);
    void PrintMultiplexerTree(std::ofstream&, int, unsigned int);
}