add_executable(cuTest_tests main.cu)

set_target_properties(cuTest_tests PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

target_include_directories(cuTest_tests PRIVATE ../include)

target_link_libraries(
        cuTest_tests
        cuTest
)

target_compile_options(cuTest_tests PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:
        -gencode arch=compute_52,code=sm_52
        -lineinfo
        >)