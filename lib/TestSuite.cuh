//
// Created by Maurice on 05.12.2022.
//

#ifndef CUDA_TEST_TESTSUITE_CUH
#define CUDA_TEST_TESTSUITE_CUH

#include <string>
#include <vector>

#include "TestCase.cuh"

namespace cuTest {
    class TestSuite {
    public:
        std::vector<TestCase> tests;

        TestSuite(){}

        TestSuite(std::string name) {
            this->name = name;
        }

        const int execute() const {
            COLOR_GREEN
            printf("[----------] ");
            COLOR_RESET
            printf("Executing %d tests from %s\n", tests.size(), name.c_str());
            uint32_t err =  0;
            for(TestCase t : tests){
                COLOR_GREEN
                printf("[ RUN      ] ");
                COLOR_RESET

                printf("%s.%s\n", name.c_str(), t.getName());
                bool result = t.execute();
                if(result){
                    COLOR_GREEN
                    printf("[       OK ] ");
                    COLOR_RESET
                    printf("%s.%s\n", name.c_str(), t.getName());
                }
                else{
                    COLOR_RED
                    printf("[    ERROR ] ");
                    COLOR_RESET
                    printf("%s.%s\n", name.c_str(), t.getName());
                    err++;
                }
            }
            if(err == 0){
                COLOR_GREEN
                printf("[----------] ");
                COLOR_RESET
                printf("Passed %d of %d tests from %s\n", tests.size(), tests.size(), name.c_str());
            }
            else{
                COLOR_RED
                printf("[----------] ");
                COLOR_RESET
                printf("Passed %d of %d tests from %s\n", tests.size()-err, tests.size(), name.c_str());
            }
            return err;
        }

    private:
        std::string name;
    };
}

#endif //CUDA_TEST_TESTSUITE_CUH
