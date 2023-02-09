#include <stdio.h>


#include "libiter_m.h"


int main()
{
    struct pair result = diophant_eq(4,6,10);
    printf("x = %ld , y = %ld \n",result.x,result.y);
}
