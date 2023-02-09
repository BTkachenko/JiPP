#include <stddef.h>
#include <stdint.h>



struct pair
{
    long x;
    long y;
};

struct ExtendedGCD
{
    long x;
    long y;
    long d;
};


long factorial( const long n);
long NWD(long a, long b);
struct ExtendedGCD euclid_extend(long a, long b);

struct pair diophant_eq(long a, long b, long c);