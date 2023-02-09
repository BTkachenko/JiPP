#include <stddef.h>
#include <stdint.h>

struct pair
{
    int64_t x;
    int64_t y;
};

long factorial( const long n);
int64_t NWD(int64_t a, int64_t b);
int64_t euclid_extend(int64_t a, int64_t b, int64_t *x, int64_t *y);
struct pair Diophant(int64_t a, int64_t b, int64_t c);