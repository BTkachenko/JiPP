#include <stdio.h>

extern int factorial (int a);
//extern struct Para diophant(int a ,int b,int c);

struct Para 
{
    int x;
    int y;
};

int main (int argc, char **argv) {

  int v = factorial(5);

  printf("Result is %d\n", v);

  // struct Para p = diophant(4,6,10);
  return 0;
}