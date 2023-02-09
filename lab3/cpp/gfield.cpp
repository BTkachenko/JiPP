#include <chrono>
#include <random>
#include "gfield.h"



long long int modInverse(const long long int value, const long long int order)
{
    long long int x = value;
    long long int y = 1;
    long long int n = order - 2;

    while (n > 0)
    {
        if (n % 2 == 1)
        {
            y = (y * x) % order;
        }

        n = n / 2;
        x = (x * x) % order;
    }

    return y;
}

bool checkPrime(const long long int number)
{
    if (number <= 1)
    {
        return false;
    }

    if (number <= 3)
    {
        return true;
    }

    if (number % 2 == 0 || number % 3 == 0)
    {
        return false;
    }

    for (int i = 5; i * i <= number; i += 6)
    {
        if (number % i == 0 || number % (i + 2) == 0)
        {
            return false;
        }
    }

    return true;
}


template <long long int mOrder>
Galois<mOrder>::Galois() : mValue(0) 
{
    if (checkPrime(mOrder) != true)
    {
        throw "\n\n  ERROR: Order must be prime! <<\n\n";
    }
}

template <long long int mOrder>
Galois<mOrder>::Galois(long long int value) : mValue(value % mOrder) 
{
    if (checkPrime(mOrder) != true)
    {
        throw "\n\n  ERROR: Order must be prime! <<\n\n";
    }

    if (value < 0)
    {
        mValue = mOrder + (value % mOrder);
    }
}


template <long long int mOrder>
long long int Galois<mOrder>::getOrder() const
{
    return mOrder;
}

template <long long int mOrder>
long long int Galois<mOrder>::getValue() const
{
    return mValue;
}


template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator + (const Galois<mOrder> field) const
{
    Galois<mOrder> result;
    result.mValue = (mValue + field.mValue) % mOrder;

    return result;
}

template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator - (const Galois<mOrder> field) const
{
    Galois<mOrder> result;
    result.mValue = (mOrder + ((mValue - field.mValue) % mOrder)) % mOrder;

    return result;
}

template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator * (const Galois<mOrder> field) const
{
    Galois<mOrder> result;
    result.mValue = (mValue * field.mValue) % mOrder;

    return result;
}

template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator / (const Galois<mOrder> field) const
{
    if (field.mValue == 0)
    {
        throw "\n\n>> ERROR: Can't divide by 0! <<";
    }

    Galois<mOrder> result;
    result.mValue = (mValue * modInverse(field.mValue, mOrder)) % mOrder;

    return result;
}


template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator + (const long long int value) const
{
    Galois<mOrder> result;
    result.mValue = (mValue + value) % mOrder;

    return result;
}

template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator - (const long long int value) const
{
    Galois<mOrder> result;
    result.mValue = (mOrder + ((mValue - value) % mOrder)) % mOrder;

    return result;
}

template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator * (const long long int value) const
{
    Galois<mOrder> result;
    result.mValue = (mValue * value) % mOrder;

    return result;
}

template <long long int mOrder>
Galois<mOrder> Galois<mOrder>::operator / (const long long int value) const
{
    if (value == 0)
    {
        throw "\n\n>> ERROR: Can't divide by 0! <<";
    }

    Galois<mOrder> result;
    result.mValue = (mValue * modInverse(value, mOrder)) % mOrder;

    return result;
}


template <long long int mOrder>
bool Galois<mOrder>::operator == (const Galois<mOrder> field) const
{
    return mValue == field.mValue;
}

template <long long int mOrder>
bool Galois<mOrder>::operator != (const Galois<mOrder> field) const
{
    return mValue != field.mValue;
}

template <long long int mOrder>
bool Galois<mOrder>::operator >= (const Galois<mOrder> field) const
{
    return mValue >= field.mValue;
}

template <long long int mOrder>
bool Galois<mOrder>::operator <= (const Galois<mOrder> field) const
{
    return mValue <= field.mValue;
}

template <long long int mOrder>
bool Galois<mOrder>::operator > (const Galois<mOrder> field) const
{
    return mValue > field.mValue;
}

template <long long int mOrder>
bool Galois<mOrder>::operator < (const Galois<mOrder> field) const
{
    return mValue < field.mValue;
}

template <long long int mOrder>
bool Galois<mOrder>::operator == (const long long int value) const
{
    return mValue == value;
}

template <long long int mOrder>
bool Galois<mOrder>::operator != (const long long int value) const
{
    return mValue != value;
}

template <long long int mOrder>
bool Galois<mOrder>::operator >= (const long long int value) const
{
    return mValue >= value;
}

template <long long int mOrder>
bool Galois<mOrder>::operator <= (const long long int value) const
{
    return mValue <= value;
}

template <long long int mOrder>
bool Galois<mOrder>::operator > (const long long int value) const
{
    return mValue > value;
}

template <long long int mOrder>
bool Galois<mOrder>::operator < (const long long int value) const
{
    return mValue < value;
}


template <long long int mOrder>
Galois<mOrder>& Galois<mOrder>::operator = (const long long int value)
{
    mValue = (mOrder + (value % mOrder)) % mOrder;

    return *this;
}

template <long long int mOrder>
Galois<mOrder>::operator int()
{
    return mValue;
}

template <long long int mOrder>
std::ostream& operator << (std::ostream& out, const Galois<mOrder> field)
{
    return out << "GF(" << mOrder << ")[" << field.mValue << "]";
}
