#include <stdio.h>
#include "gfield.cpp"
#include "polynomial.cpp"

using namespace std;;


int main()
{
    vector<double> v = {7, 5, 16, 8};
    Polynomial p(v);
    cout<<p<<endl;
    vector<Galois<2>> gf ={1,0,1,1,1,0,0,0,0,1};
    Polynomial pgf(gf);
    cout<<pgf<<endl;


}
