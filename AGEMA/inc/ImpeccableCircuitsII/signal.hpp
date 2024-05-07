#pragma once

#include <boost/multiprecision/cpp_int.hpp>

#include "ImpeccableCircuitsII/util.hpp"

class uint2048_t{
    public:
        uint2048_t() : data_{{0, 0}} {}
        friend bool operator<(const uint2048_t& lhs, const uint2048_t& rhs) {
            if (lhs.data_[1] != rhs.data_[1]){
                return lhs.data_[1] < rhs.data_[1];
            }else{
                return lhs.data_[0] < rhs.data_[0];
            }
        }

        friend bool operator>(const uint2048_t& lhs, const uint2048_t& rhs) {
            if (lhs.data_[1] != rhs.data_[1]){
                return lhs.data_[1] > rhs.data_[1];
            }else{
                return lhs.data_[0] > rhs.data_[0];
            }
        }       

        friend uint2048_t operator|(const uint2048_t& lhs, const uint2048_t& rhs) {
            uint2048_t result;
            result.data_[1] = lhs.data_[1] | rhs.data_[1];
            result.data_[0] = lhs.data_[0] | rhs.data_[0];
            return result;
        }   

        uint2048_t(const uint2048_t& other) : data_(other.data_) {}

        friend bool operator==(const uint2048_t& lhs, const uint2048_t& rhs) {
            return lhs.data_ == rhs.data_;
        }

        std::array<boost::multiprecision::uint1024_t, 2> data_;
};

namespace ImpeccableCircuitsII{
    struct Anf{
        std::map<uint2048_t, bool> Monomials;
        int Parity = 0;
        bool Linear = true;
    };

    struct Signal{
        std::string Name = "no_name";
        std::string Appendix = "no_appendix";
        int Index = -1;
        int ModuleCounter = -1;
        int Depth = -1;
        std::string Annotation = "control";
        bool PrimaryInput = false;
        bool PrimaryOutput = false;
        bool RegisterOutput = false;
        unsigned int Linear = 0;
        int share_domain = -1;

        Signal();
        Signal(std::string);
        void SetName(std::string);
        std::string GetName();
        bool operator==(const Signal&) const;
    };

    std::string GetNameWithoutIndex(std::string&);
    int GetIndex(std::string&);
    std::string PrintSignals(std::vector<ImpeccableCircuitsII::Signal>&);
}

