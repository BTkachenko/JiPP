#include <iostream>
#include <cassert>
#include <map>
#include "gfield.cpp"
#include "polynomial.cpp"


using namespace std;

typedef Galois<2> GF;

const int CODEWORD_LENGTH = 7;
const int MESSAGE_LENGTH = 4;
const GF GF_ZERO = GF(0);
const GF GF_ONE = GF(1);


Polynomial<GF> gfPolynomialFromNum(int value)
{
    if (value == 0)
    {
        return Polynomial<GF>(GF_ZERO);
    }

    vector<GF> coeffs;

    while (value > 0)
    {
        coeffs.push_back(GF(value));
        value /= 2;
    }

    Polynomial<GF> result(coeffs);

    return result;
}


Polynomial<GF> degreePolynomial(int degree)
{
    vector<GF> coeffs(degree + 1, GF_ZERO);
    coeffs[degree] = GF_ONE;
    Polynomial<GF> result(coeffs);

    return result;
}


Polynomial<GF> encode(Polynomial<GF> message, 
                      Polynomial<GF> generator,
                      Polynomial<GF> modulo)
{

    return (message * generator) % modulo;
}


std::map<Polynomial<GF>, Polynomial<GF>> codewordBase(Polynomial<GF> generator)
{
    std::map<Polynomial<GF>, Polynomial<GF>> base;

    for (int i = 0; i < pow(2, MESSAGE_LENGTH); i++)
    {
        Polynomial<GF> message = gfPolynomialFromNum(i);
        Polynomial<GF> codeword = message * generator; 
        base.insert(std::pair<Polynomial<GF>, Polynomial<GF>>(codeword, message));

        for (int j = 0; j < CODEWORD_LENGTH; j++)
        {
            Polynomial<GF> error_codeword = codeword;
            error_codeword += degreePolynomial(j);
            base[error_codeword] = message;
        }
    }

    return base;
}


void printPolyBits(Polynomial<GF> poly)
{
    vector<GF> bits = poly.getCoefficients();

    while (bits.size() <= CODEWORD_LENGTH)
    {
        bits.push_back(GF_ZERO);
    } 

    for (GF b: bits)
    {
        cout << b.getValue();
    }

}


int main()
{
    int random_int = 4;
    Polynomial<GF> message = gfPolynomialFromNum(random_int);
    Polynomial<GF> generator({GF_ONE, GF_ONE, GF_ZERO, GF_ONE});
    Polynomial<GF> modulo_poly({GF_ONE, GF_ZERO, GF_ZERO, GF_ZERO, GF_ZERO, GF_ZERO, GF_ZERO, GF_ONE});

    std::map<Polynomial<GF>, Polynomial<GF>> codeword_base = codewordBase(generator);    


    cout << "Cykl Hemming 7,4 test"<<endl;

    cout << "\nGenerator: " << generator<<endl;
    cout << "Bitstring: "<<endl;
    printPolyBits(generator);

    cout << "\nModulo polynomial: " << modulo_poly<<endl;
    cout << "BitString: "<<endl;
    printPolyBits(modulo_poly);
    
    cout << "\nMessage: " << message<<endl;
    cout << "\nBitstring: "<<endl;
    printPolyBits(message);

    Polynomial<GF> codeword = encode(message, generator, modulo_poly);
    cout << "\nGenerated codeword: " << codeword;
    cout << "\n Bitstring: "<<endl;
    printPolyBits(codeword);


    cout << "Distorting codeword with 0010000 \n"<<endl;

    Polynomial<GF> codeword_distorted = codeword + degreePolynomial(2);
    cout << " \nDistorted codeword: " << codeword_distorted;
    cout << "Bitstring In bits: "<<endl;
    printPolyBits(codeword_distorted);

    Polynomial<GF> message_distorted = codeword_base[codeword_distorted];
    cout << "Distorted message: " << message_distorted;
    cout << "\n Bitstring: "<<endl;
    printPolyBits(message_distorted);

    cout<<"\nmessage_distorted == message: "<<(message_distorted == message)<<endl;


    



    return 0;
}