cmake_minimum_required(VERSION 3.20)
project(cuTestAll CUDA CXX)

set(CMAKE_CUDA_STANDARD 14)

include(FetchContent)

set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}")

set(cmake_package_name cuTest CACHE INTERNAL "")

add_subdirectory(lib)
add_subdirectory(tests)