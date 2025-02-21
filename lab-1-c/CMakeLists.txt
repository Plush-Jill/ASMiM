cmake_minimum_required(VERSION 3.30)
project(lab_1_c C)

set(CMAKE_C_STANDARD 17)

add_executable(latency
        latency-measuring.c
)

add_executable(IPC
        IPC-measuring.c
)