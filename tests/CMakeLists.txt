add_executable(tests main.cu)

set_target_properties(tests PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

target_include_directories(tests PRIVATE ../include)

target_link_libraries(
        tests
        cuTest
        cuTest_main
)

target_compile_options(tests PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:
        -gencode arch=compute_52,code=sm_52
        -lineinfo
        >)