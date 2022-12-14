//
// Created by Maurice on 05.12.2022.
//

#ifndef CUTEST_CUTEST_H
#define CUTEST_CUTEST_H
#include <string>

#ifdef _MSC_VER
    #if CUTEST_LINKED_AS_SHARED_LIBRARY
        #define CUTEST_API_ __declspec(dllimport)
    #elif CUTEST_CREATE_SHARED_LIBRARY
        #define CUTEST_API_ __declspec(dllexport)
    #endif
#elif __GNUC__ >= 4 || defined(__clang__)
    #if CUTEST_CREATE_SHARED_LIBRARY
        #define CUTEST_API_ __attribute__((visibility ("default")))
    #endif
#endif // _MSC_VER

#ifndef CUTEST_API_
# define CUTEST_API_
#endif

#define CPU_ASSERT_EQ(x,y, desc) if(x != y){\
    cuTest::throwError(desc, #x+std::string("!=")+std::string(#y)); \
}

namespace cuTest{
    CUTEST_API_ void throwError(std::string msg, std::string failure);
    CUTEST_API_ void executeTests();
    CUTEST_API_ bool addTest(std::string suite, std::string _case, void (*f)());
}

#define TEST(x,y) \
    static void cutest_test_##x##_##y(); \
    bool cutest_dummy_##x##_##y = cuTest::addTest(#x, #y, cutest_test_##x##_##y); \
    static void cutest_test_##x##_##y()



#endif //CUTEST_CUTEST_H
