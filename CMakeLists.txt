cmake_minimum_required(VERSION 3.20)
project(cuTestAll CUDA CXX)

set(CMAKE_CUDA_STANDARD 14)

include(FetchContent)

set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}")

set(cmake_package_name cuTest CACHE INTERNAL "")

if (INSTALL_CUTEST)
    include(CMakePackageConfigHelpers)
    set(targets_export_name ${cmake_package_name}Targets CACHE INTERNAL "")
    set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated" CACHE INTERNAL "")
    set(cmake_files_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${cmake_package_name}")
    set(version_file "${generated_dir}/${cmake_package_name}ConfigVersion.cmake")
    write_basic_package_version_file(${version_file} VERSION ${CUTEST_VERSION} COMPATIBILITY AnyNewerVersion)
    install(EXPORT ${targets_export_name}
            NAMESPACE ${cmake_package_name}::
            DESTINATION ${cmake_files_install_dir})
    set(config_file "${generated_dir}/${cmake_package_name}Config.cmake")
    configure_package_config_file("${cutest_SOURCE_DIR}/cmake/Config.cmake.in"
            "${config_file}" INSTALL_DESTINATION ${cmake_files_install_dir})
    install(FILES ${version_file} ${config_file}
            DESTINATION ${cmake_files_install_dir})
endif()

set(cutest_build_include_dirs
        "${cutest_SOURCE_DIR}/include"
  #      "${cutest_SOURCE_DIR}"
)
include_directories(${cutest_build_include_dirs})
add_subdirectory(lib)
add_subdirectory(tests)