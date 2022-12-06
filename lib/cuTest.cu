#include <vector>
#include <map>
#include <string>
#include "helper.cuh"
#include "TestSuite.cuh"

namespace cuTest{
    static std::map<std::string, TestSuite> tests;

    static uint32_t test_count = 0;

    static bool addTest(std::string suite, std::string _case, void (*f)()){
        TestSuite s;
        if(tests.count(suite)){
            s = tests.at(suite);
        }
        else{
            s = TestSuite(suite);
        }
        TestCase t(_case, f);
        s.tests.push_back(t);

        tests[suite] = s;

        test_count++;

        return true;
    }

    static void executeTests(){

        COLOR_GREEN
        printf("[==========] ");
        COLOR_RESET
        printf("Executing %d tests from %d test suites\n", test_count, tests.size());

        uint32_t err_c = 0;
        uint32_t err_s = 0;

        for(auto const& t : tests){
            uint32_t res = t.second.execute();
            if(res > 0){
                err_s++;
                err_c += res;
            }
        }

        if(err_c == 0) {
            COLOR_GREEN
            printf("[==========] ");
            printf("Executed %d tests from %d test suites\n", test_count, tests.size());
            printf("[  PASSED  ] ");
            printf("%d/%d tests passed from %d/%d test suites\n", test_count, test_count, tests.size(), tests.size());
            COLOR_RESET
        }
        else{
            COLOR_RED
            printf("[==========] ");
            printf("Executed %d tests from %d test suites\n", test_count, tests.size());
            printf("[  FAILED  ] ");
            printf("%d/%d tests passed from %d/%d test suites\n", test_count-err_c, test_count, tests.size()-err_s, tests.size());
            COLOR_RESET
        }
    }
}