#include "ImpeccableCircuitsII/code.hpp"

void ImpeccableCircuitsII::LookupTable::SetOutputWidth(){
    this->OutputWidth = 1;

    // Compute how many bits are needed to represent the output
    unsigned int Output = std::max_element(Mapping.begin(), Mapping.end(), [](const std::pair<unsigned int, unsigned int>& x, const std::pair<unsigned int, unsigned int>& y){return x.second < y.second;})->second;
    while (Output >>= 1) {this->OutputWidth++;}
}

void ImpeccableCircuitsII::LookupTable::SetCoordinateFunctions(){
    unsigned int BitIndex = 0;
    std::vector<bool> ValueBits(this->OutputWidth, 0);

    for (auto const& [Key, Value] : this->Mapping){
        for (BitIndex = 0; BitIndex < this->OutputWidth; BitIndex++){
            // Convert multi-bit wird into vector of single bits
            ValueBits.at(BitIndex) = (Value >> BitIndex) & 1;
        }
            
        // Add key and a vector of single bits as coordinate function    
        this->CoordinateFunctions.insert(std::pair<unsigned int, std::vector<bool>>(Key, ValueBits));
    }
}

void ImpeccableCircuitsII::LookupTable::GetSumOfProducts(){
    unsigned int NumberOfInputs = 1 << InputWidth;
    unsigned int InputIndex, OutputIndex;
    std::vector<char> TruthTable(NumberOfInputs, 2); // 2 = don't care
    SumOfProducts.resize(OutputWidth);

    for (OutputIndex = 0; OutputIndex < OutputWidth; OutputIndex++){
        // Generate complete truth table with don't cares
        for (InputIndex = 0; InputIndex < NumberOfInputs; InputIndex++){
            if (CoordinateFunctions.find(InputIndex) != CoordinateFunctions.end()){ 
                TruthTable.at(InputIndex) = CoordinateFunctions.at(InputIndex).at(OutputIndex);
            }
        }

        SumOfProducts.at(OutputIndex) = ImpeccableCircuitsII::QuineMcCluskey(InputWidth, TruthTable);
    }
}

int ImpeccableCircuitsII::HammingAdjacent(std::vector<char>& Subcube1, std::vector<char>& Subcube2){
    unsigned int BitIndex;
    int Result = -1;
    bool Found = false;

    for (BitIndex = 0; BitIndex < Subcube1.size(); BitIndex++){
        if (Subcube1.at(BitIndex) != Subcube2.at(BitIndex)){
            if (Found){
                return -1;
            }else{
                Found = true;
                Result = BitIndex; // Store the index of the last different element
            }
        }
    }

    return Result;
}

std::vector<std::vector<std::pair<std::vector<char>, bool>>> ImpeccableCircuitsII::FindSubcubes(unsigned int InputWidth, std::vector<char>& TruthTable){
    std::cout << "Find subcubes..." << std::flush;
    std::vector<std::vector<std::pair<std::vector<char>, bool>>> Result(InputWidth + 1);
    std::pair<std::vector<char>, bool> Subcube;
    unsigned int BitIndex, InputIndex;

    Subcube.first.resize(InputWidth);
    Subcube.second = false;

    for (InputIndex = 0; InputIndex < (unsigned int)(1 << InputWidth); InputIndex++){
        if (TruthTable.at(InputIndex)){
            // Store subcubes bitwise in a vector
            for (BitIndex = 0; BitIndex < InputWidth; BitIndex++){
                Subcube.first.at(BitIndex) = (InputIndex >> BitIndex) & 1;
            }

            Result.at(__builtin_popcount(InputIndex)).push_back(Subcube);
        }
    }

    std::cout << Result.size() << " subcubes found...PASSED" << std::endl;
    return Result;
}

std::vector<unsigned int> ImpeccableCircuitsII::FindMinterms(unsigned int InputWidth, std::vector<char>& TruthTable){
    std::cout << "Find minterms..." << std::flush;
    std::vector<unsigned int> Result;

    for (unsigned int InputIndex = 0; InputIndex < (1 << InputWidth); InputIndex++){
        if (TruthTable.at(InputIndex) == 1){
            Result.push_back(InputIndex);
        }
    }

    std::cout << Result.size() << " minterms found...PASSED" << std::endl;
    return Result;
}

std::vector<std::vector<std::pair<std::vector<char>, bool>>> ImpeccableCircuitsII::GetNextSubcubes(unsigned int InputWidth, std::vector<std::vector<std::pair<std::vector<char>, bool>>>& Subcubes){
    std::cout << "Get next subcubes..." << std::flush;
    std::vector<std::vector<std::pair<std::vector<char>, bool>>> Result(InputWidth + 1);
    std::pair<std::vector<char>, bool> Subcube;
    unsigned int GroupIndex, i, j;
    int CombineIndex;

    Subcube.first.resize(InputWidth);
    Subcube.second = false;

    for (GroupIndex = 0; GroupIndex < InputWidth; GroupIndex++){
        for (i = 0; i < Subcubes.at(GroupIndex).size(); i++){
            for (j = 0; j < Subcubes.at(GroupIndex + 1).size(); j++){
                CombineIndex = ImpeccableCircuitsII::HammingAdjacent(Subcubes.at(GroupIndex).at(i).first, Subcubes.at(GroupIndex + 1).at(j).first);
                
                if (CombineIndex != -1){
                    // Add new subcube to the list 
                    Subcube.first = Subcubes.at(GroupIndex).at(i).first;
                    Subcube.first.at(CombineIndex) = -1;

                    // Check if the subcube is already in the list
                    if (std::find(Result.at(GroupIndex).begin(), Result.at(GroupIndex).end(), Subcube) == Result.at(GroupIndex).end()){
                        Result.at(GroupIndex).push_back(Subcube);
                    }

                    // Mark the subcubes as covered
                    Subcubes.at(GroupIndex).at(i).second = true;
                    Subcubes.at(GroupIndex + 1).at(j).second = true;
                }
            }
        }
    }

    std::cout << Result.size() << " subcubes found...PASSED" << std::endl;
    return Result;
}

std::vector<std::vector<char>> ImpeccableCircuitsII::FindPrimeImplicants(unsigned int InputWidth, std::vector<std::vector<std::vector<std::pair<std::vector<char>, bool>>>>& Subcubes){
    std::cout << "Find prime implicants..." << std::flush;
    std::vector<std::vector<char>> Result;
    unsigned int BitIndex, InputIndex, StepIndex;
    
    for (StepIndex = 0; StepIndex < InputWidth; StepIndex++){
        for (InputIndex = 0; InputIndex <= InputWidth; InputIndex++){
            for (BitIndex = 0; BitIndex < Subcubes.at(StepIndex).at(InputIndex).size(); BitIndex++){
                if (!Subcubes.at(StepIndex).at(InputIndex).at(BitIndex).second){ 
                    Result.push_back(Subcubes.at(StepIndex).at(InputIndex).at(BitIndex).first);
                }
            }
        }
    }

    std::cout << Result.size() << " prime implicants found...PASSED" << std::endl;
    return Result;
}

std::vector<std::vector<bool>> ImpeccableCircuitsII::GenerateTable(unsigned int InputWidth, std::vector<std::vector<char>>& PrimeImplicants, std::vector<unsigned int>& Minterms){
    std::vector<std::vector<bool>> Result(PrimeImplicants.size(), std::vector<bool>(Minterms.size(), true));
    unsigned int BitIndex, InputIndex, StepIndex;

    for (StepIndex = 0; StepIndex < PrimeImplicants.size(); StepIndex++){
        for (InputIndex = 0; InputIndex < Minterms.size(); InputIndex++){
            for (BitIndex = 0; BitIndex < InputWidth; BitIndex++){
                if ((PrimeImplicants.at(StepIndex).at(BitIndex) != ((Minterms.at(InputIndex) >> BitIndex) & 1)) && (PrimeImplicants.at(StepIndex).at(BitIndex) != -1)){
                    Result.at(StepIndex).at(InputIndex) = false;
                    break;
                }
            }
        }
    }

    return Result;
}

bool ImpeccableCircuitsII::RemoveMinterms(std::vector<std::vector<char>>& PrimeImplicants, std::vector<unsigned int>& Minterms, std::vector<std::vector<bool>>& Table){
    bool Result = false;
    std::vector<unsigned int> NewMinterms, RemovedMinterms;
    unsigned int BitIndex, InputIndex;
    std::vector<bool> Removed(Minterms.size(), false);

    for (InputIndex = 0; InputIndex < Minterms.size(); InputIndex++){
        // Check if the minterm is already removed
        if (!Removed.at(InputIndex)){

            // Check if the prime implicant is essential
            if (PrimeImplicants.size() == 1){
                for (BitIndex = 0; BitIndex < Minterms.size(); BitIndex++){
                    if (Table.at(0).at(BitIndex) && (BitIndex != InputIndex)){
                        Removed.at(BitIndex) = true;
                    }
                }
            }
        }
    }

    for (InputIndex = 0; InputIndex < Minterms.size(); InputIndex++){
        if (!Removed.at(InputIndex)){
            NewMinterms.push_back(Minterms.at(InputIndex));
        }
    }

    if (Minterms.size() == NewMinterms.size()){Result = false;}else{Result = true;}
    Minterms = NewMinterms;
    return Result;
}

bool ImpeccableCircuitsII::RemovePrimeImplicants(std::vector<std::vector<char>>& PrimeImplicants, std::vector<unsigned int>& Minterms, std::vector<std::vector<bool>>& Table){
    bool Result;
    unsigned int BitIndex, InputIndex, StepIndex;
    std::vector<std::vector<char>> NewPrimeImplicants;
    std::vector<bool> Removed(PrimeImplicants.size(), false);

    // If one row dominates another row, we can remove the dominated row
    for (StepIndex = 0; StepIndex < PrimeImplicants.size(); StepIndex++){
        for (BitIndex = 0; BitIndex < PrimeImplicants.size(); BitIndex++){
            if (StepIndex != BitIndex && !Removed.at(StepIndex) && !Removed.at(BitIndex)){
                Removed.at(BitIndex) = true;
                        
                for (InputIndex = 0; InputIndex < Minterms.size(); InputIndex++){
                    if (!Table.at(StepIndex).at(InputIndex) && Table.at(BitIndex).at(InputIndex)){
                        Removed.at(BitIndex) = false;
                        break;
                    }
                }
            }
        }
    }

    for (StepIndex = 0; StepIndex < PrimeImplicants.size(); StepIndex++){
        if (!Removed.at(StepIndex)){
            NewPrimeImplicants.push_back(PrimeImplicants.at(StepIndex));
        }
    }

    if (PrimeImplicants.size() == NewPrimeImplicants.size()){Result = false;}else{Result = true;}
    PrimeImplicants = NewPrimeImplicants;
    return Result;
}

std::vector<std::vector<unsigned int>> ImpeccableCircuitsII::GeneratePOS(std::vector<std::vector<char>>& PrimeImplicants, std::vector<unsigned int>& Minterms, std::vector<std::vector<bool>>& Table){
    std::cout << "Generate product-of-sum representation..." << std::flush;
    std::vector<std::vector<unsigned int>> Result(Minterms.size());
    unsigned int InputIndex, GroupIndex;

    for (InputIndex = 0; InputIndex < Minterms.size(); InputIndex++){
        for (GroupIndex = 0; GroupIndex < PrimeImplicants.size(); GroupIndex++){
            if (Table.at(GroupIndex).at(InputIndex)){
                Result.at(InputIndex).push_back(GroupIndex);
            }          
        }
    }

    std::cout << Result.size() << " sums found...PASSED" << std::endl;
    return Result;
}

std::vector<unsigned int> ImpeccableCircuitsII::FindMinimumSOP(std::vector<std::vector<unsigned int>>& ProductOfSums){
    std::cout << "Find minimum sum-of-products representation..." << std::flush;
    int ProductIndex;
    std::vector<unsigned int> Product;
    unsigned int Counter = 0;

    for (ProductIndex = 0; ProductIndex < (int)ProductOfSums.size(); ProductIndex++){
        std::sort(ProductOfSums.at(ProductIndex).begin(), ProductOfSums.at(ProductIndex).end());
    }    
    
    // Remove monomials which are the same or simpler as other monomials
    std::sort(ProductOfSums.begin(), ProductOfSums.end());
    ProductOfSums.erase(std::unique(ProductOfSums.begin(), ProductOfSums.end()), ProductOfSums.end());

    std::vector<unsigned int> Result(ProductOfSums.size() + 1, 0);
    std::vector<unsigned int> Indices(ProductOfSums.size(), 0);

    while (Counter != 0xfffffff){
        Product.clear();
        Product.resize(ProductOfSums.size());

        // Check the current cover
        for (ProductIndex = 0; ProductIndex < (int)ProductOfSums.size(); ProductIndex++){
            Product.at(ProductIndex) = ProductOfSums.at(ProductIndex).at(Indices.at(ProductIndex));
        }

        std::sort(Product.begin(), Product.end());
        Product.erase(std::unique(Product.begin(), Product.end()), Product.end());

        if (Product.size() < Result.size()){
            Result = Product;
        }     

        // Move to the next cover
        ProductIndex = ProductOfSums.size() - 1;  
        while ((ProductIndex >= 0) && (Indices.at(ProductIndex) == (ProductOfSums.at(ProductIndex).size() - 1))){
            Indices.at(ProductIndex) = 0;
            ProductIndex--;
        }

        // Stop after the last cover
        if (ProductIndex < 0){
            break;
        }

        Indices.at(ProductIndex)++;
        Counter++;
    }

    std::cout << Counter << " PASSED" << std::endl;
    return Result;
}

std::vector<std::vector<char>> ImpeccableCircuitsII::QuineMcCluskey(unsigned int InputWidth, std::vector<char>& TruthTable){
    std::vector<std::vector<char>> Result;
    bool MintermRemoved = true, PrimeImplicantRemoved = true;
    std::vector<std::vector<std::vector<std::pair<std::vector<char>, bool>>>> Subcubes(InputWidth, std::vector<std::vector<std::pair<std::vector<char>, bool>>>(InputWidth + 1));
    std::vector<std::vector<bool>> Table;
    std::vector<std::vector<char>> PrimeImplicants;
    std::vector<std::vector<unsigned int>> ProductOfSums;
    std::vector<unsigned int> Minterms, Minimum;

    Subcubes.at(0) = ImpeccableCircuitsII::FindSubcubes(InputWidth, TruthTable);
    Minterms = ImpeccableCircuitsII::FindMinterms(InputWidth, TruthTable);
    
    for (unsigned int StepIndex = 1; StepIndex < InputWidth; StepIndex++){
        Subcubes.at(StepIndex) = ImpeccableCircuitsII::GetNextSubcubes(InputWidth, Subcubes.at(StepIndex - 1));
    }

    PrimeImplicants = ImpeccableCircuitsII::FindPrimeImplicants(InputWidth, Subcubes);

    std::cout << "Remove prime implicants and mintzerms..." << std::flush;
    while (MintermRemoved || PrimeImplicantRemoved){
        Table = ImpeccableCircuitsII::GenerateTable(InputWidth, PrimeImplicants, Minterms);
        MintermRemoved = ImpeccableCircuitsII::RemoveMinterms(PrimeImplicants, Minterms, Table);
        Table = ImpeccableCircuitsII::GenerateTable(InputWidth, PrimeImplicants, Minterms);
        PrimeImplicantRemoved = ImpeccableCircuitsII::RemovePrimeImplicants(PrimeImplicants, Minterms, Table);
    }
    std::cout << "PASSED" << std::endl;

    Table = ImpeccableCircuitsII::GenerateTable(InputWidth, PrimeImplicants, Minterms);
    ProductOfSums = ImpeccableCircuitsII::GeneratePOS(PrimeImplicants, Minterms, Table);
    Minimum = ImpeccableCircuitsII::FindMinimumSOP(ProductOfSums);

    for (unsigned int InputIndex = 0; InputIndex < Minimum.size(); InputIndex++){
        Result.push_back(PrimeImplicants.at(Minimum.at(InputIndex)));
    }

    return Result;
}

void ImpeccableCircuitsII::ErrorCorrectingCode::SetParityWidth(){
    this->ParityWidth = this->MessageToParity.OutputWidth;
}

void ImpeccableCircuitsII::ErrorCorrectingCode::SetCodewordWidth(){
    this->CodewordWidth = this->MessageWidth + this->ParityWidth;
}

void ImpeccableCircuitsII::ErrorCorrectingCode::SetMinimumDistance(){
    std::cout << "Set minimum distance..." << std::flush;
    this->MinimumDistance = (this->NumberOfCorrectedFaults << 1) + 1;
    std::cout << "Minimum distance set to " << this->MinimumDistance << "...PASSED" << std::endl;
}

bool ImpeccableCircuitsII::ErrorCorrectingCode::TooSmallDistance(unsigned int Message, unsigned int Parity){
    unsigned int Distance = 0;

    for (auto const& [MessageEntry, ParityEntry] : this->MessageToParity.Mapping){
        Distance = __builtin_popcount(MessageEntry ^ Message) + __builtin_popcount(ParityEntry ^ Parity);
        if (Distance < this->MinimumDistance){return true;}
    }

    return false;
}

void ImpeccableCircuitsII::ErrorCorrectingCode::SetLookupTables(){
    std::cout << "Store mappings as LUTs..." << std::flush;
    unsigned int Message = 0, Parity = 0;

    for (Message = 0; Message != (unsigned int)(1 << this->MessageWidth); Message++){

        // Satisfy distance and injectivity
        while (this->TooSmallDistance(Message, Parity) || this->ParityToMessage.Mapping.find(Parity) != this->ParityToMessage.Mapping.end()){
            Parity++;
        }
        
        // Insert the entry to all mappings
        this->MessageToParity.Mapping.insert(std::pair<unsigned int, unsigned int>(Message, Parity));
        this->ParityToMessage.Mapping.insert(std::pair<unsigned int, unsigned int>(Parity, Message));
        Parity = 0;
    }
    
    std::cout << "PASSED" << std::endl;
}

unsigned int ImpeccableCircuitsII::ErrorCorrectingCode::GetNumberOfInputVariables(){
    unsigned int MonomialIndex, OutputIndex, VariableIndex, NumberOfInputs = 0;
    std::vector<unsigned int> Inputs(this->MessageToParity.InputWidth, 0);
   
    for (OutputIndex = 0; OutputIndex < this->MessageToParity.OutputWidth; OutputIndex++){
        for (MonomialIndex = 0; MonomialIndex < this->MessageToParity.SumOfProducts.at(OutputIndex).size(); MonomialIndex++){
            for (VariableIndex = 0; VariableIndex < this->MessageToParity.SumOfProducts.at(OutputIndex).at(MonomialIndex).size(); VariableIndex++){
                if (this->MessageToParity.SumOfProducts.at(OutputIndex).at(MonomialIndex).at(VariableIndex) != -1){
                    Inputs.at(VariableIndex) = 1;
                }
            }
        }   

        NumberOfInputs = std::accumulate(Inputs.begin(), Inputs.end(), NumberOfInputs);
        std::fill(Inputs.begin(), Inputs.end(), 0);
    }

    return NumberOfInputs;
}

bool ImpeccableCircuitsII::ConvertAnfToLut(unsigned int InputWidth, unsigned int OutputWidth, unsigned int Index, std::vector<std::vector<unsigned int>>& Monomials, std::vector<std::vector<bool>>& DistanceAndInjective){
    unsigned int Message, Parity, NumberOfMessages = 1 << InputWidth;
    int ParityIndex = Index;
    std::vector<unsigned int> Combination(OutputWidth);

    for (Parity = 0; Parity < OutputWidth; Parity++){
        Combination.at(Parity) = Monomials.at(Parity).at(ParityIndex % Monomials.at(Parity).size());
        ParityIndex /= Monomials.at(Parity).size();
    }

    for (Message = 0; Message != NumberOfMessages; Message++){
        Parity = 0;

        for (ParityIndex = OutputWidth - 1; ParityIndex >= 0; ParityIndex--){
            Parity <<= 1;
            Parity |= __builtin_popcount(Message & Combination.at(ParityIndex)) & 1;
        }  

        if (!DistanceAndInjective.at(Message).at(Parity)){
            return false;
        }
    } 

    return true;
}

bool ImpeccableCircuitsII::GetPartitions(unsigned int n, std::vector<unsigned int>& Partition){
    unsigned int Index, Index2;

    // Check whether another partition is possible
    for (Index = 0; Index < Partition.size(); Index++){
        if (Partition.at(Index) < (Partition.at(0) - 1)){
            break;
        }
    }
    
    if (Index == Partition.size()){
        return false;
    }

    for (Index2 = 1; Index2 <= Index; Index2++){
        Partition.at(Index2) = Partition.at(Index) + 1;
    }
    
    Partition.at(0) = n;

    for (Index2 = 1; Index2 < Partition.size(); Index2++){
        Partition.at(0) -= Partition.at(Index2);
    }
    return true;     
}

void ImpeccableCircuitsII::ErrorCorrectingCode::Optimize(){
    unsigned int NewInputSize = this->GetNumberOfInputVariables() - 1, NewOutputSize = this->MessageToParity.OutputWidth;
    unsigned int NumberOfMessages = 1 << this->MessageToParity.InputWidth, NumberOfParities = 1 << NewOutputSize;
    unsigned int Index, Message, Parity, MonomialInt;
    int MessageIndex, ParityIndex, ThreadIndex;
    std::vector<unsigned int> Monomial(this->MessageToParity.InputWidth);
    std::vector<unsigned int> NumberOfInputsPerCoordinateFunction;
    std::vector<std::vector<bool>> DistanceAndInjective;
    std::vector<unsigned int> Combination;
    std::vector<std::vector<unsigned int>> Monomials;
    bool Found = false;
    uint64_t NumberOfCombinations;
    unsigned int NumberOfThreads = 16;
    omp_set_num_threads(NumberOfThreads);

    std::vector<int> FoundCombinations(NumberOfThreads, -1);
    std::cout << "The current linear, injective [" << this->CodewordWidth << "," << this->MessageWidth << "," << this->MinimumDistance << "] code has " << this->GetNumberOfInputVariables() << " input variables..." << std::flush;

    while(NewOutputSize < NewInputSize){
        Monomials.clear();
        Combination.clear();
        FoundCombinations.clear();
        DistanceAndInjective.clear();
        NumberOfInputsPerCoordinateFunction.clear();
        Monomials.resize(NewOutputSize);
        Combination.resize(NewOutputSize);
        DistanceAndInjective.resize(NumberOfMessages, std::vector<bool>(NumberOfParities));
        NumberOfInputsPerCoordinateFunction.resize(NewOutputSize, 1);
        FoundCombinations.resize(NumberOfThreads, -1);

        for (Message = 0; Message != NumberOfMessages; Message++){
            for (Parity = 0; Parity != NumberOfParities; Parity++){
                Index = __builtin_popcount(Message) + __builtin_popcount(Parity);
                DistanceAndInjective.at(Message).at(Parity) = (Index >= this->MinimumDistance || Index == 0) && !(Parity == 0 && Message != 0);
            }
        }

        // Initialize the coordinate function inputs with the first partition
        Index = 0;

        for (Parity = 0; Parity < NewInputSize - NewOutputSize; Parity++){
            if(NumberOfInputsPerCoordinateFunction.at(Index) == this->MessageToParity.InputWidth){
                Index++;
            }

            NumberOfInputsPerCoordinateFunction.at(Index)++;
        }

        do{
            NumberOfCombinations = 1;
            Found = false;

            // Precompute the different coordinate functions
            for (Parity = 0; Parity < NewOutputSize; Parity++){
                Monomials.at(Parity).clear();

                std::fill(Monomial.begin(), Monomial.end(), 0);
                std::fill(Monomial.begin(), Monomial.begin() + NumberOfInputsPerCoordinateFunction.at(Parity), 1);
                 
                do{
                    MonomialInt = 0;
                    
                    for (MessageIndex = this->MessageToParity.InputWidth - 1; MessageIndex >= 0; MessageIndex--){
                        MonomialInt <<= 1;
                        MonomialInt |= Monomial.at(MessageIndex);
                    }

                    Monomials.at(Parity).push_back(MonomialInt);
                } while (std::prev_permutation(Monomial.begin(), Monomial.end()));

                NumberOfCombinations *= Monomials.at(Parity).size();
            }

            #pragma omp parallel for schedule(guided) private(ThreadIndex) 
            for (Index = 0; Index < NumberOfCombinations; Index++){
                ThreadIndex = omp_get_thread_num();
                if (!Found){
                    if (ImpeccableCircuitsII::ConvertAnfToLut(this->MessageToParity.InputWidth, NewOutputSize, Index, Monomials, DistanceAndInjective)){
                        FoundCombinations.at(ThreadIndex) = Index;
                        Found = true;
                    }  
                } 
            }

            if (Found){
                for (Index = 0; Index < FoundCombinations.size(); Index++){
                    if (FoundCombinations.at(Index) != -1){
                        this->MessageToParity.Mapping.clear();
                        this->ParityToMessage.Mapping.clear();

                        for (Parity = 0; Parity < NewOutputSize; Parity++){
                            Combination.at(Parity) = Monomials.at(Parity).at(FoundCombinations.at(Index) % Monomials.at(Parity).size());
                            FoundCombinations.at(Index) /= Monomials.at(Parity).size();
                        }

                        for (Message = 0; Message != NumberOfMessages; Message++){
                            Parity = 0;

                            for (ParityIndex = NewOutputSize - 1; ParityIndex >= 0; ParityIndex--){
                                Parity <<= 1;
                                Parity |= __builtin_popcount(Message & Combination.at(ParityIndex)) & 1;
                            }

                            this->MessageToParity.Mapping.insert(std::pair<unsigned int, unsigned int>(Message, Parity));
                            this->ParityToMessage.Mapping.insert(std::pair<unsigned int, unsigned int>(Parity, Message));
                        }  

                        this->MessageToParity.OutputWidth = NewOutputSize;
                        this->ParityToMessage.InputWidth = this->MessageToParity.OutputWidth;    
                        break;
                    }
                }
            }

            if (Found){
                break;
            }       
        } while (GetPartitions(NewInputSize, NumberOfInputsPerCoordinateFunction));

        if(Found){
            std::cout << "Better linear, injective [" << this->MessageWidth + this->MessageToParity.OutputWidth << "," << this->MessageWidth << "," << this->MinimumDistance << "] code with " << NewInputSize << " input variables found..." << std::flush;
            //NewInputSize--;
            NewInputSize = 0;
        }else{
            NewOutputSize++;
            NumberOfParities <<= 1;
        }
    }
}

void ImpeccableCircuitsII::ErrorCorrectingCode::SetSyndromeDecoders(){
    unsigned int BitIndex = 0, FaultIndex = 0, Message = 0, Parity = 0, Syndrome = 0;
    std::vector<unsigned int> FaultBitmask(this->CodewordWidth, 0);

    this->SyndromeDecoder[0].InputWidth = this->ParityWidth;
    this->SyndromeDecoder[1].InputWidth = this->ParityWidth;
    this->SyndromeDecoder[0].OutputWidth = this->MessageWidth;
    this->SyndromeDecoder[1].OutputWidth = this->ParityWidth;

    // Generate all possible fault vectors
    for (FaultIndex = 0; FaultIndex <= this->NumberOfCorrectedFaults; FaultIndex++){
        // Set the bitmask to the first possible faulty bits
        std::fill(FaultBitmask.begin(), FaultBitmask.end(), 0);
	    std::fill(FaultBitmask.begin(), FaultBitmask.begin() + FaultIndex, 1);

        // Iterate through all possible combinations of faults to correct
	    do
	    {
            // Convert bitmask to message and parity 
            Message = 0, Parity = 0;

            for (BitIndex = 0; BitIndex < this->CodewordWidth; BitIndex++){
                if (BitIndex < this->ParityWidth){
                    Parity <<= 1;
                    Parity |= FaultBitmask[BitIndex];
                }else{
                    Message <<= 1;
                    Message |= FaultBitmask[BitIndex];
                }
            }

            // Compute syndrome of the fault vector
            Syndrome = this->MessageToParity.Mapping[Message] ^ Parity;
            this->SyndromeDecoder[0].Mapping.insert(std::pair<unsigned int, unsigned int>(Syndrome, Message));
            this->SyndromeDecoder[1].Mapping.insert(std::pair<unsigned int, unsigned int>(Syndrome, Parity));
	    } while (std::prev_permutation(FaultBitmask.begin(), FaultBitmask.end()));  
    }
}

void ImpeccableCircuitsII::ErrorCorrectingCode::CheckMappings(){
    unsigned int NumberOfMessages = 1 << MessageWidth; 
    unsigned int BitIndex, CorrectedMessage, CorrectedParity, FaultIndex, FaultyMessage, FaultyParity, Message, Parity, Syndrome;
    std::vector<unsigned int> FaultBitmask(CodewordWidth, 0);

    // Test the correction point for all messages
    for (Message = 0; Message < NumberOfMessages; Message++){
        // Compute the Parity
        Parity = MessageToParity.Mapping.at(Message);

        // Check the inversion
        if (ParityToMessage.Mapping.at(Parity) != Message){
            std::cout << "[ERROR] Inversion mapping is not correct!" << std::endl;
            getchar();
        }

        // Generate all possible fulat vectors
        for (FaultIndex = 0; FaultIndex <= NumberOfCorrectedFaults; FaultIndex++){
            // Set the bitmask to the first possible faulty bits
            std::fill(FaultBitmask.begin(), FaultBitmask.end(), 0);
	        std::fill(FaultBitmask.begin(), FaultBitmask.begin() + FaultIndex, 1);

            // Iterate through all possible combinations of faults to correct
	        do{
                FaultyMessage = Message;
                FaultyParity = Parity;

                // Apply the fault
                for (BitIndex = 0; BitIndex < this->CodewordWidth; BitIndex++){
                    if (BitIndex < MessageWidth){
                        FaultyMessage ^= (FaultBitmask.at(BitIndex) << BitIndex);
                    }else{
                        FaultyParity ^= (FaultBitmask.at(BitIndex) << (BitIndex - MessageWidth));
                    }
                }

                // Correct the fault with the correction point
                Syndrome = MessageToParity.Mapping.at(FaultyMessage) ^ FaultyParity;
                CorrectedMessage = SyndromeDecoder.at(0).Mapping.at(Syndrome) ^ FaultyMessage;
                CorrectedParity = SyndromeDecoder.at(1).Mapping.at(Syndrome) ^ FaultyParity;

                if ((CorrectedMessage != Message) || (CorrectedParity != Parity)){
                    std::cout << "[ERROR] Correction point mapping is not correct!" << std::endl;
                    getchar();
                }
            } while (std::prev_permutation(FaultBitmask.begin(), FaultBitmask.end())); 
        }
    }
}

unsigned int ImpeccableCircuitsII::LookupTable::EvaluateSOPs(unsigned int Input){
    unsigned int Bit, FunctionIndex, Monomial, MonomialIndex, VariableIndex, Result = 0;

    for (FunctionIndex = 0; FunctionIndex < SumOfProducts.size(); FunctionIndex++){
        Bit = 0;

        for (MonomialIndex = 0; MonomialIndex < SumOfProducts.at(FunctionIndex).size(); MonomialIndex++){
            Monomial = 1;

            for (VariableIndex = 0; VariableIndex < SumOfProducts.at(FunctionIndex).at(MonomialIndex).size(); VariableIndex++){
                if (SumOfProducts.at(FunctionIndex).at(MonomialIndex).at(VariableIndex) == 1){
                    Monomial &= (Input >> VariableIndex) & 1;
                }else if (SumOfProducts.at(FunctionIndex).at(MonomialIndex).at(VariableIndex) == 0){
                    Monomial &= ((Input >> VariableIndex) & 1) ^ 1;
                }
            }

            Bit |= Monomial;
        }

        Result |= (Bit << FunctionIndex);
    }
    
    return Result;
}

void ImpeccableCircuitsII::ErrorCorrectingCode::CheckSOPs(){
    unsigned int NumberOfMessages = 1 << MessageWidth; 
    unsigned int BitIndex, CorrectedMessage, CorrectedParity, FaultIndex, FaultyMessage, FaultyParity, Message, Parity, Syndrome;
    std::vector<unsigned int> FaultBitmask(CodewordWidth, 0);

    // Test the correction point for all messages
    for (Message = 0; Message < NumberOfMessages; Message++){
        // Compute the Parity
        Parity = MessageToParity.EvaluateSOPs(Message);

        // Check the inversion
        if (ParityToMessage.EvaluateSOPs(Parity) != Message){
            std::cout << "[ERROR] Inversion mapping is not correct!" << std::endl;
            std::cout << "LUT: " << Message << " " << MessageToParity.Mapping.at(Message) << " " << ParityToMessage.Mapping.at(MessageToParity.Mapping.at(Message)) << std::endl;
            std::cout << "SOP: " << Message << " " << Parity << " " << ParityToMessage.EvaluateSOPs(Parity) << std::endl;
            getchar();
        }

        // Generate all possible fulat vectors
        for (FaultIndex = 0; FaultIndex <= NumberOfCorrectedFaults; FaultIndex++){
            // Set the bitmask to the first possible faulty bits
            std::fill(FaultBitmask.begin(), FaultBitmask.end(), 0);
	        std::fill(FaultBitmask.begin(), FaultBitmask.begin() + FaultIndex, 1);

            // Iterate through all possible combinations of faults to correct
	        do{
                FaultyMessage = Message;
                FaultyParity = Parity;

                // Apply the fault
                for (BitIndex = 0; BitIndex < this->CodewordWidth; BitIndex++){
                    if (BitIndex < MessageWidth){
                        FaultyMessage ^= (FaultBitmask.at(BitIndex) << BitIndex);
                    }else{
                        FaultyParity ^= (FaultBitmask.at(BitIndex) << (BitIndex - MessageWidth));
                    }
                }

                // Correct the fault with the correction point
                Syndrome = MessageToParity.EvaluateSOPs(FaultyMessage) ^ FaultyParity;
                CorrectedMessage = SyndromeDecoder.at(0).EvaluateSOPs(Syndrome) ^ FaultyMessage;
                CorrectedParity = SyndromeDecoder.at(1).EvaluateSOPs(Syndrome) ^ FaultyParity;

                if ((CorrectedMessage != Message) || (CorrectedParity != Parity)){
                    std::cout << "[ERROR] Correction point mapping is not correct!" << std::endl;
                    getchar();
                }
            } while (std::prev_permutation(FaultBitmask.begin(), FaultBitmask.end())); 
        }
    }
}

ImpeccableCircuitsII::ErrorCorrectingCode::ErrorCorrectingCode(unsigned int k, unsigned int d, bool op){
    this->MessageWidth = k;
    this->MessageToParity.InputWidth = k;
    this->ParityToMessage.OutputWidth = k;
    this->NumberOfCorrectedFaults = d;
    this->SyndromeDecoder.resize(2);
    std::cout << "Find code that corrects " << this->NumberOfCorrectedFaults << " fault(s) in a " << this->MessageWidth << "-bit message" << std::endl;

    this->SetMinimumDistance();
    this->SetLookupTables();

    std::cout << "Set parity size..." << std::flush;
    this->MessageToParity.SetOutputWidth();
    std::cout << "Parity size set to " << this->MessageToParity.OutputWidth << "...PASSED" << std::endl;

    std::cout << "Set message size..." << std::flush;
    this->ParityToMessage.InputWidth = this->MessageToParity.OutputWidth;
    std::cout << "Message size set to " << this->MessageWidth << "...PASSED" << std::endl;

    std::cout << "Set parity size..." << std::flush;
    this->SetParityWidth();
    std::cout << "Parity size set to " << this->ParityWidth << "...PASSED" << std::endl;

    std::cout << "Set codeword size..." << std::flush;
    this->SetCodewordWidth(); 
    std::cout << "Codeword size set to " << this->CodewordWidth << "...PASSED" << std::endl;
    std::cout << "Linear, injective [" << this->CodewordWidth << "," << this->MessageWidth << "," << this->MinimumDistance << "] code found" << std::endl;

    this->MessageToParity.SetCoordinateFunctions();
    this->ParityToMessage.SetCoordinateFunctions();
    this->MessageToParity.GetSumOfProducts();
    this->ParityToMessage.GetSumOfProducts();

    if (op){
        std::cout << "Optimize the code parameters..." << std::flush;
        this->Optimize();
        std::cout << "PASSED" << std::endl;       

        this->MessageToParity.CoordinateFunctions.clear();
        this->ParityToMessage.CoordinateFunctions.clear();
        this->MessageToParity.SumOfProducts.clear();
        this->ParityToMessage.SumOfProducts.clear();

        std::cout << "Set parity size..." << std::flush;
        this->SetParityWidth();
        std::cout << "Parity size set to " << this->ParityWidth << "...PASSED" << std::endl;

        std::cout << "Set codeword size..." << std::flush;
        this->SetCodewordWidth(); 
        std::cout << "Codeword size set to " << this->CodewordWidth << "...PASSED" << std::endl;

        this->MessageToParity.SetCoordinateFunctions();
        this->ParityToMessage.SetCoordinateFunctions();
        this->MessageToParity.GetSumOfProducts();
        this->ParityToMessage.GetSumOfProducts();
    }

    std::cout << "Store syndrome decoder as LUT..." << std::flush;
    this->SetSyndromeDecoders();
    std::cout << "PASSED" << std::endl;

    std::cout << "Prepare coordinate functions..." << std::flush;
    this->SimpleXor.SetCoordinateFunctions();
    this->SyndromeDecoder[0].SetCoordinateFunctions();
    this->SyndromeDecoder[1].SetCoordinateFunctions();
    std::cout << "PASSED" << std::endl;

    std::cout << "Prepare SOPs..." << std::flush;
    this->SimpleXor.GetSumOfProducts();
    this->SyndromeDecoder[0].GetSumOfProducts();
    this->SyndromeDecoder[1].GetSumOfProducts();
    std::cout << "PASSED" << std::endl;

    std::cout << "Check code mappings for correctness..." << std::flush;
    this->CheckMappings();
    std::cout << "PASSED" << std::endl;  

    std::cout << "Check code SOPs for correctness..." << std::flush;
    this->CheckSOPs();
    std::cout << "PASSED" << std::endl;  
}








