#include <stddef.h>
#include <stdint.h>

struct ExtendedGCD
{
    long x;
    long y;
    long d;
};

struct pair
{
    long x;
    long y;
};

int my_func (int a,int b);
long factorial( const long n);
int mynwd(int a, int b);

struct ExtendedGCD euclid_extend(long a, long b);
struct pair diophant_eq(long a, long b, long c);