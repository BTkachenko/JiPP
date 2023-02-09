#include <stdio.h>
#include <stdio.h>
#include <stddef.h>
#include <stdint.h>
#include "libiter_m.h"





long NWD(long a, long b)
{
    long pom;
    
	while(b!=0)
    {
		pom = b;
		b = a%b;
		a = pom;	
	}
	
    return a;
}


long factorial( const long n)
{
    size_t res = 1;
    for (size_t i = 2; i <= n; i++)
        res *= i;
    return res;
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