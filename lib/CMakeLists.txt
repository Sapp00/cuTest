set(LIB_HEADERS TestSuite.cuh TestCase.cuh helper.cuh ../include/cuTest.cuh)
set(LIB_SRC cuTest.cu cpu.cu gpu.cu )
add_library(cuTest SHARED ${LIB_SRC} ${LIB_HEADERS})


target_include_directories(cuTest PUBLIC ../include)

set_target_properties(cuTest PROPERTIES LINKER_LANGUAGE CUDA)
set_target_properties(cuTest PROPERTIES COMPILE_DEFINITIONS "CUTEST_CREATE_SHARED_LIBRARY=1")
target_compile_definitions(cuTest INTERFACE $<INSTALL_INTERFACE:CUTEST_LINKED_AS_SHARED_LIBRARY=1>)

set(targets_export_name ${cmake_package_name} CACHE INTERNAL "")
set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated" CACHE INTERNAL "")
set(cmake_files_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${cmake_package_name}")

install(TARGETS ${targets_export_name}
        DESTINATION ${cmake_files_install_dir})