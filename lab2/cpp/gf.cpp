#include "gf.h"

int64_t inverse(const int64_t a){
    int64_t y =  1;
    int64_t n = P -2;
    int64_t x = a;
    while (n>0) {
        if(n%2 == 1){
            y = (y*x) % P;
        }
        n = n/2;
        x = (x*x) % P;
    }
    return y %P ;
}

//Konstruktory :

GF::GF() {
    order = P;value = 0;
}

GF::GF(int64_t val)  {
   order = P;value = val % P;
   
    if (val < 0)
    {
        value =  P + (val % P);
    }
    
}

GF::~GF() {}


//Getery:

int64_t GF::getOrder() const
{
    return order;
}

int64_t GF::getValue() const
{
    return this->value;
}

//Setery:

void GF::setValue(int64_t v)
{
    value = v;
}

void GF::setOrder(int64_t ord)
{
    order = ord;
}

//Operatory :

GF GF::operator + (const GF obj) const 
{
    GF result;
    result.setValue((value + obj.getValue()) % P);
    return result;
}


GF GF::operator - (const GF obj) const 
{
    GF result;
    result.setValue((P + ((value - obj.getValue()) % P))%P);
    return result;
}

GF GF::operator * (const GF obj) const 
{
    GF result;
    result.setValue(value * obj.getValue() % P);
    return result;
}

GF GF::operator / (const GF obj) const 
{

    if( obj.getValue() ==0 ){
        throw "\n !!! CANT DIVIDE BY 0! !!! \n ";
    }
    GF result;
    result.setValue(value * inverse(obj.getValue()) % P);
    return result;
}

bool GF::operator == (const GF obj) const 
{
    return value == obj.getValue();
}

bool GF::operator != (const GF obj) const 
{
    return value != obj.getValue();
}
bool GF::operator >= (const GF obj) const 
{
    return value >= obj.getValue();
}
bool GF::operator <= (const GF obj) const 
{
    return value <= obj.getValue();
}
bool GF::operator > (const GF obj) const 
{
    return value > obj.getValue();
}
bool GF::operator < (const GF obj) const 
{
    return value < obj.getValue();
}






//Operatory dla działań z typem liczbowym a nie obiektem:

GF GF::operator + (const int64_t x) const 
{
    GF result;
    result.setValue((value + x) % P);
    return result;
}


GF GF::operator - (const int64_t x) const 
{
    GF result;
    result.setValue(P + ((value - x) % P));
    return result;
}

GF GF::operator * (const int64_t x) const 
{
    GF result;
    result.setValue((value * x) % P);
    return result;
}

GF GF::operator / (const int64_t x) const 
{

    if(x ==0 ){
        throw "\n !!! CANT DIVIDE BY 0! !!! \n ";
    }
    GF result;
    result.setValue(value * inverse(x) % P);
    return result;
}

bool GF::operator == (const int64_t x) const 
{
    return value == x;
}

bool GF::operator != (const int64_t x) const 
{
    return value == x;
}

bool GF::operator >= (const int64_t x) const 
{
    return value >= x;
}

bool GF::operator <= (const int64_t x) const 
{
    return value <= x;
}
bool GF::operator > (const int64_t x) const 
{
    return value > x;
}

bool GF::operator < (const int64_t x) const 
{
    return value > x;
}

GF::operator int64_t(){
    return value;
}

std::ostream& operator << (std::ostream& out, const GF obj)
{
    return out << "GF(" << obj.getOrder() << ") =  " << obj.getValue();
}