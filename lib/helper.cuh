//
// Created by Maurice on 05.12.2022.
//

#ifndef CUTESTALL_HELPER_CUH
#define CUTESTALL_HELPER_CUH

#include <cuTest.cuh>
#include <exception>

#define COLOR_RED printf("\033[1;31m");
#define COLOR_GREEN printf("\033[0;32m");
#define COLOR_YELLOW printf("\033[1;33m");
#define COLOR_RESET printf("\033[0m");

namespace cuTest{
    struct TestException : public std::exception{
        const char* what () const throw ()
        {
            return "Test Exception";
        }
    };
    static void throwError(std::string msg, std::string failure){
        COLOR_RED
        printf("Error: %s. %s\n", msg.c_str(), failure.c_str());
        COLOR_RESET
        throw TestException();
    }
}

#endif //CUTESTALL_HELPER_CUH