#include <stdio.h>

// Сложение больших чисел, представленных массивами цифр (младшие разряды в начале)
int add(const int *a, int na, const int *b, int nb, int *c) {
    int n = (na > nb ? na : nb);
    int carry = 0;
    for (int i = 0; i < n; ++i) {
        int sum = (i < na ? a[i] : 0)
                + (i < nb ? b[i] : 0)
                + carry;
        c[i] = sum % 10;
        carry = sum / 10;
    }
    if (carry) {
        c[n++] = carry;
    }
    return n;
}

// Индекс первого числа Фибоначчи с n цифрами
int index_fib_with_digits(int n) {
    if (n <= 1) return 1;

    int a[1100] = {1};  // F1
    int b[1100] = {1};  // F2
    int c[1100];
    int na = 1, nb = 1, nc;
    int index = 2;

    while (nb < n) {
        // c = a + b
        nc = add(a, na, b, nb, c);

        // сдвигаем последовательность (a,b) ← (b,c)
        for (int i = 0; i < nb; ++i)
            a[i] = b[i];
        na = nb;

        for (int i = 0; i < nc; ++i)
            b[i] = c[i];
        nb = nc;

        ++index;
    }
    return index;
}

int main(void) {
    printf("%d\n", index_fib_with_digits(1000)); // ожидаемо: 4782
    return 0;
}
