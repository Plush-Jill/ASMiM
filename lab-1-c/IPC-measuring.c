#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <bits/fcntl-linux.h>

inline __uint64_t rdtscp() {
    __uint64_t aux;
    __uint64_t rax, rdx;
    asm volatile ("rdtscp" : "=a" (rax), "=d" (rdx), "=c" (aux) :: "memory");
    return (rdx << 32) | rax;
}

int main() {
    int devnull = open("/dev/null", O_WRONLY);
    if (devnull == -1) {
        perror("open");
        exit(EXIT_FAILURE);
    }
    dup2(devnull, STDERR_FILENO);
    close(devnull);


    register double num = 0.999999999;
    int operations_count = 7;
    register double num1 = 1.0001;
    register double num2 = 1.0002;
    register double num3 = 1.0003;
    register double num4 = 1.0004;
    register double num5 = 1.0005;
    register double num6 = 1.0006;
    register double num7 = 1.0007;

    for (register int i = 0; i < 80000000; ++i) {
        num1 *= num;
        num2 *= num;
        num3 *= num;
        num4 *= num;
        num5 *= num;
        num6 *= num;
        num7 *= num;
    }

    fprintf(stderr, "%lf, %lf, %lf, %lf, %lf, %lf, %lf\n", num1, num2, num3, num4, num5, num6, num7);
    const register int iter_count = 10000000;
    register const __uint64_t start = rdtscp();

    num1 = 0.9999991;
    num2 = 0.9999992;
    num3 = 0.9999993;
    num4 = 0.9999994;
    num5 = 0.9999995;
    num6 = 0.9999996;
    num7 = 0.9999997;


    for (register int i = 0; i < iter_count; ++i) {
        num1 *= num;
        num2 *= num;
        num3 *= num;
        num4 *= num;
        num5 *= num;
        num6 *= num;
        num7 *= num;
    }

    register const __uint64_t end = rdtscp();
    const __uint64_t total_clock_count = end - start;
    const double IPC = (double)(total_clock_count) / (double)(iter_count * operations_count);
    fprintf(stdout, "IPC: %lf\n", IPC);
    fprintf(stderr, "%lf, %lf, %lf, %lf, %lf, %lf, %lf\n", num1, num2, num3, num4, num5, num6, num7);
    return 0;
}
