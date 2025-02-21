#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sched.h>
#include <fcntl.h>
#include <unistd.h>

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

    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(0, &cpuset);

    if (pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset) != 0) {
        perror("pthread_setaffinity_np");
        exit(EXIT_FAILURE);
    }

    int operations_count = 7;
    register double num1 = 0.999999999;
    register double num2 = 0.999999999;
    register double num3 = 0.999999999;
    register double num4 = 0.999999999;
    register double num5 = 0.999999999;
    register double num6 = 0.999999999;
    register double num7 = 0.999999999;

    for (register int i = 0; i < 300000000; ++i) {
        num1 *= num7;
        num2 *= num1;
        num3 *= num2;
        num4 *= num3;
        num5 *= num4;
        num6 *= num5;
        num7 *= num6;
    }

    fprintf(stderr, "%lf, %lf, %lf, %lf, %lf, %lf, %lf\n", num1, num2, num3, num4, num5, num6, num7);

    const register long iter_count = 1000;

    num1 = 0.9999991;
    num2 = 0.9999992;
    num3 = 0.9999993;
    num4 = 0.9999994;
    num5 = 0.9999995;
    num6 = 0.9999996;
    num7 = 0.9999997;

    register const __uint64_t start = rdtscp();
    for (register long i = 0; i < iter_count; ++i) {
        num1 *= num7;
        num2 *= num1;
        num3 *= num2;
        num4 *= num3;
        num5 *= num4;
        num6 *= num5;
        num7 *= num6;
    }
    register const __uint64_t end = rdtscp();
    const __uint64_t total_clock_count = end - start;
    const __uint64_t clock_per_operation = total_clock_count / (iter_count * operations_count);

    fprintf(stdout, "Latency: %lu\n", clock_per_operation);

    fprintf(stderr, "%lf, %lf, %lf, %lf, %lf, %lf, %lf\n", num1, num2, num3, num4, num5, num6, num7);

    return 0;
}
