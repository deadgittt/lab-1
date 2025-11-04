#include <stdio.h>

unsigned long long
gcd(unsigned long long a, unsigned long long b) {
    while (b != 0) {
        unsigned long long temp = a % b;
        a = b;
        b = temp;
    }
    return a;
}

unsigned long long
lcm(unsigned long long a, unsigned long long b) {
    return (a / gcd(a, b)) * b;
}

unsigned long long
smallest_multiple(int n) {
    unsigned long long result = 1;
    for (int k = 2; k <= n; k++) {
        result = lcm(result, k);
    }
    return result;
}

int
main(void) {
    int n = 20;
    printf("Наименьшее число, делящееся на все числа 1..%d is %llu\n",
           n, smallest_multiple(n));
    return 0;
}
