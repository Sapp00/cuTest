set(LIB_HEADERS TestSuite.cuh TestCase.cuh helper.cuh cpu.cu gpu.cu)
add_library(cuTest SHARED cuTest.cu ../include/cuTest.cuh ${LIB_HEADERS})

target_compile_definitions(cuTest PUBLIC DLL_EXPORT=1)
target_include_directories(cuTest PRIVATE ../include)

set_target_properties(cuTest PROPERTIES COMPILE_DEFINITIONS "CUTEST_CREATE_SHARED_LIBRARY=1")
target_compile_definitions(cuTest INTERFACE $<INSTALL_INTERFACE:CUTEST_LINKED_AS_SHARED_LIBRARY=1>)

set(PKGCONFIG_INSTALL_DIR
        "${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig"
        CACHE PATH "Path where catch2.pc is installed"
        )

install(
        FILES
        "${CMAKE_CURRENT_BINARY_DIR}/cuTest.pc"
 #       "${CMAKE_CURRENT_BINARY_DIR}/cuTest_main.pc"
        DESTINATION
        ${PKGCONFIG_INSTALL_DIR}
)