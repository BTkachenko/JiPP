#include <stdio.h>
#include "rec_math.h"





long factorial( const long n)
{
    if(n == 1 || n == 0)
    {
        return 1;
    }
    return n * factorial(n-1);
}


int64_t NWD(int64_t a, int64_t b)
{
   if(b != 0)
        return(NWD(b,a%b));
   return a;
}


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

struct pair Diophant(int64_t a, int64_t b, int64_t c)
{
    int64_t x,y;
    int64_t gcd = euclid_extend(a,b,&x,&y);
    struct pair result;
    if(c%gcd !=0)
    {
        result.x = INT64_MIN;
        result.y = INT64_MIN;
    }
    else 
    {
        result.x = x*(c/gcd);
        result.y = y * (c/gcd);
    }

    return result;
}