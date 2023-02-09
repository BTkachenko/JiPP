#include <stdio.h>
#include "librec_m.h"




int my_func (int a,int b)
{
    return a * b;
}

long factorial( long n)
{
    if(n == 1 || n == 0)
    {
        return 1;
    }
    return n * factorial(n-1);
}


int mynwd(int a, int b)
{
   if(b != 0)
        return(mynwd(b,a%b));
   return a;
}




struct ExtendedGCD euclid_extend(long a, long b)
{
    struct ExtendedGCD result;
    if(b==0)
    {
        result.d = a;
        result.x=1;
        result.y = 0;

        return result;
    }

    result = euclid_extend(b,a%b);
    int t  = result.y;
     result.y = result.x - (a/b)*(result.y);
    result.x = t;
    return result;
}
/*
int64_t euclid_extend(int64_t a, int64_t b, int64_t *x, int64_t *y)
{
    // Base Case
    if (b == 0) {
        *x = 1;
        *y = 0;
        return a;
    }
 
    // Recursively find the gcd
    else {
        int g = euclid_extend(b,
                           a % b, x, y);
        int x1 = *x, y1 = *y;
        *x = y1;
        *y = x1 - (a / b) * y1;
        return g;
    }
}

*/

struct pair diophant_eq(long a, long b, long c)
{
    long x,y;
    struct ExtendedGCD gcd = euclid_extend(a,b);
    struct pair result;
    if(c%gcd.d !=0)
    {
        result.x = 0;
        result.y = 0;
    }
    else 
    {
        result.x = gcd.x*(c/gcd.d);
        result.y = gcd.y * (c/gcd.d);
    }

    return result;
}