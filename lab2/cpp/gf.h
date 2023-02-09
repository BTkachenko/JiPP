#include <stdbool.h>
#include  <string.h>
#include <iostream>
#include <cstdint>


#define P 1234567891


int64_t inverse(const int64_t x);
//GF(P)
class GF
{
private:
    int64_t value;
    int64_t order;
public:
    GF();
    GF(int64_t value);

     int64_t getValue() const;
    int64_t getOrder()const ;
    void setValue(int64_t);
    void setOrder(int64_t);

    
    ~GF();

    GF operator + (GF const obj) const;
    GF operator - (GF const obj) const;
    GF operator * (GF const obj) const;
    GF operator / (GF const obj) const;

     bool operator == (const GF field) const;
     bool operator != (const GF field) const;
     bool operator >= (const GF field) const;
     bool operator <= (const GF field) const;
     bool operator > (const GF field) const;
     bool operator < (const GF field) const;



    GF operator + (const int64_t x) const;
    GF operator - (const int64_t x) const;
    GF operator * (const int64_t x) const;
    GF operator / (const int64_t x) const;

     bool operator == (const int64_t x) const;
     bool operator != (const int64_t x) const;
     bool operator >= (const int64_t x) const;
     bool operator <= (const int64_t x) const;
     bool operator > (const int64_t x) const;
     bool operator < (const int64_t x) const;

    friend std::ostream& operator << (std::ostream& out, const GF field);
    operator int64_t();
};





