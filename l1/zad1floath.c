// Mateusz Tofil
#include <float.h>
#include <stdio.h>


int main() {
    printf("%.10e\n", FLT_EPSILON);
    printf("%.10e\n", DBL_EPSILON);

    printf("%.10e\n", FLT_MAX);
    printf("%.10e\n", DBL_MAX);

    return 0;
}