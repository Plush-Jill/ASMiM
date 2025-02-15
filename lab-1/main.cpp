#include <cstdint>
#include <iostream>
#include <vector>
// rdtsc/rdtscp


inline uint64_t rdtscp() {
    uint32_t aux;
    uint64_t rax, rdx;
    asm volatile ("rdtscp" : "=a" (rax), "=d" (rdx), "=c" (aux) :: "memory");
    return (rdx << 32) | rax;
}

int main() {
    const register int array_size {30};
    std::vector<double> arr (array_size, 1.1);
    register double num {1.2};



    for (register int i {0}; i < 100'000; ++i) {
        for (register int j {1}; j < array_size; ++j) {
            arr[j] /= arr[j-1];
        }
    }


    const uint64_t start = rdtscp();

    for (register int i {0}; i < 1'000'000; ++i) {
        for (register int j {1}; j < array_size; ++j) {
            arr[j] /= arr[j-1];
        }
    }

    const uint64_t end = rdtscp();
    uint64_t cycles_count = end - start;



    return 0;
}