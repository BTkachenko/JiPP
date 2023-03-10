#ifndef GF_H
#define GF_H

#include <iostream>


inline constexpr long long int TEST_ORDER = 1234567891;

double randomDouble(const long long int order);
long long int randomLLInt(const long long int order);
long long int modInverse(const long long int value, const long long int order);
bool checkPrime(const long long int value);


template <long long int mOrder>
class Galois {
private:
    long long int mValue;
public:
    Galois();
    Galois(long long int value);
        

    long long int getOrder() const;
    long long int getValue() const;


    Galois<mOrder> operator + (const Galois<mOrder> field) const;
    Galois<mOrder> operator - (const Galois<mOrder> field) const;
    Galois<mOrder> operator * (const Galois<mOrder> field) const;
    Galois<mOrder> operator / (const Galois<mOrder> field) const;

    Galois<mOrder> operator + (const long long int value) const;
    Galois<mOrder> operator - (const long long int value) const;
    Galois<mOrder> operator * (const long long int value) const;
    Galois<mOrder> operator / (const long long int value) const;


    bool operator == (const Galois<mOrder> field) const;
    bool operator != (const Galois<mOrder> field) const;
    bool operator >= (const Galois<mOrder> field) const;
    bool operator <= (const Galois<mOrder> field) const;
    bool operator > (const Galois<mOrder> field) const;
    bool operator < (const Galois<mOrder> field) const;

    bool operator == (const long long int value) const;
    bool operator != (const long long int value) const;
    bool operator >= (const long long int value) const;
    bool operator <= (const long long int value) const;
    bool operator > (const long long int value) const;
    bool operator < (const long long int value) const;


    Galois<mOrder>& operator = (const long long int value);
    operator int();


    template <long long int order>
    friend std::ostream& operator << (std::ostream& out, const Galois<order> field);
};


#endif
