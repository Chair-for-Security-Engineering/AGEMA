#pragma once

#include <algorithm>
#include <iostream>
#include <map>
#include <vector>
#include <numeric>
#include <cinttypes>
#include <omp.h>

namespace ImpeccableCircuitsII{
    struct LookupTable{
        unsigned int InputWidth = 1, OutputWidth = 1;
        std::map<unsigned int, unsigned int> Mapping;
        std::map<unsigned int, std::vector<bool>> CoordinateFunctions;
        std::vector<std::vector<std::vector<char>>> SumOfProducts;

        unsigned int EvaluateSOPs(unsigned int);
        void SetOutputWidth();
        void SetCoordinateFunctions();
        void GetSumOfProducts();
    };

    struct ErrorCorrectingCode{
        unsigned int CodewordWidth = 0, MessageWidth = 0, ParityWidth = 0;
        unsigned int MinimumDistance = 0, NumberOfCorrectedFaults = 0;
        LookupTable MessageToParity, ParityToMessage;
        LookupTable SimpleXor = {2, 1, {{0, 0}, {1, 1}, {2, 1}, {3, 0}}, {{0, {false}}, {1, {true}}, {2, {true}}, {3, {false}}}, {{{1,0},{0,1}}}};
        std::vector<LookupTable> SyndromeDecoder;

        void CheckMappings();
        void CheckSOPs();
        void SetParityWidth();
        void SetCodewordWidth();
        void SetMinimumDistance();
        bool TooSmallDistance(unsigned int, unsigned int);
        void SetLookupTables();
        void Optimize();
        unsigned int GetNumberOfInputVariables();
        void SetSyndromeDecoders();
        ErrorCorrectingCode(unsigned int, unsigned int, bool);
    };

    std::vector<std::vector<char>> QuineMcCluskey(unsigned int, std::vector<char>&);
    int HammingAdjacent(std::vector<char>&, std::vector<char>&);
    bool ConvertAnfToLut(unsigned int, unsigned int, unsigned int, std::vector<std::vector<unsigned int>>&, std::vector<std::vector<bool>>&);
    bool GetPartitions(unsigned int, std::vector<unsigned int>&);
    std::vector<std::vector<std::pair<std::vector<char>, bool>>> FindSubcubes(unsigned int, std::vector<char>&);
    std::vector<unsigned int> FindMinterms(unsigned int, std::vector<char>&);
    std::vector<std::vector<std::pair<std::vector<char>, bool>>> GetNextSubcubes(unsigned int, std::vector<std::vector<std::pair<std::vector<char>, bool>>>&);
    std::vector<std::vector<char>> FindPrimeImplicants(unsigned int, std::vector<std::vector<std::vector<std::pair<std::vector<char>, bool>>>>&);
    std::vector<std::vector<bool>> GenerateTable(unsigned int, std::vector<std::vector<char>>&, std::vector<unsigned int>&);
    bool RemoveMinterms(std::vector<std::vector<char>>& , std::vector<unsigned int>&, std::vector<std::vector<bool>>&);
    bool RemovePrimeImplicants(std::vector<std::vector<char>>&, std::vector<unsigned int>&, std::vector<std::vector<bool>>&);
    std::vector<std::vector<unsigned int>> GeneratePOS(std::vector<std::vector<char>>&, std::vector<unsigned int>&, std::vector<std::vector<bool>>&);
    std::vector<unsigned int> FindMinimumSOP(std::vector<std::vector<unsigned int>>&);

}
