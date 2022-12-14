//
// Created by Maurice on 05.12.2022.
//

#ifndef CUDA_TEST_TESTCASE_CUH
#define CUDA_TEST_TESTCASE_CUH


namespace cuTest {
    class TestCase {
    public:
        TestCase(std::string name, void (*f)()) {
            this->name = name;
            this->func = f;
        }

        bool execute(){
            try{
                func();
            }
            catch(TestException t){
                return false;
            }
            catch(...){
                return false;
            }
            return true;
        }

        const char* getName(){
            return name.c_str();
        }

    private:
        std::string name;
        void (*func)();
    };
}

#endif //CUDA_TEST_TESTCASE_CUH
