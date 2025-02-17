#include <stdio.h>
#include <stdlib.h>
// rdtsc/rdtscp


inline __uint64_t rdtscp() {
    __uint64_t aux;
    __uint64_t rax, rdx;
    asm volatile ("rdtscp" : "=a" (rax), "=d" (rdx), "=c" (aux) :: "memory");
    return (rdx << 32) | rax;
}

int main() {
    register int array_size = 10;
    // std::vector<double> arr (array_size, 1.1);
    double array[array_size];
    for (int i = 0; i < array_size; i++) {
        array[i] = 1.1;
    }
    register double num = 1.2;



    for (register int i = 0; i < 6000000; ++i) {
        for (register int j = 1; j < array_size; ++j) {
            array[j] += array[j-1] + (rand() % 2) * 0.00001;
        }
    }

    printf("start (%lf)\n", array[4]);
    register int iter_count = 10000000;
    register const __uint64_t start = rdtscp();

    for (register int i = 0; i < iter_count; ++i) {
        for (register int j = 1; j < array_size; ++j) {
            array[j] *= array[j-1];
        }
    }

    register const __uint64_t end = rdtscp();
    __uint64_t total_clock_count = end - start;
    // double cpu_frequency_ghz {4.5};
    __uint64_t clock_per_operation = total_clock_count / (iter_count * array_size);
    // std::cout << std::format("Clock per operation: {}\n");
    printf("Clock per operation: %lu\n", clock_per_operation);
    // for (register int i = 0; i < array_size; ++i) {
    //     printf("%lf ", array[i]);
    // }
    printf("%lf\n", array[4]);
    return 0;
}