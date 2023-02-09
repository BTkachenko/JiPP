

#include <stdlib.h>
#include "gf.h"
#include<cstdint>


using namespace std;

int main()
{
    cout<< "Podstawa ciała : " << P <<endl;

    int64_t n1 = 5;
    int64_t n2 = ((long)1234567890 * 2);
    cout<< "Liczba 1 : " << n1 <<endl;
    cout<< "Liczba 1 : " << n2 <<endl;

    GF gf1(n1);
    GF gf2(n2);
    cout <<"GF1 = " << gf1 <<endl;
    cout <<"GF2 = " << gf2 <<endl;
    cout <<"gf1 + gf2 = " << gf1 + gf2 <<endl;
    cout <<"gf1 - gf2 = " << gf1 - gf2 <<endl;
    cout <<"gf1 * gf2 = " << gf1 * gf2 <<endl;
    cout <<"gf1 / gf2 = " << gf1 / gf2 <<endl;
   

}

