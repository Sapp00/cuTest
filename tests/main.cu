//
// Created by Maurice on 05.12.2022.
//

#include <cuTest_main.cuh>

//__declspec(dllimport) int main(int argc, char **argv);

void cutest_test_a_b();
void main2() {
    cuTest::addTest(std::string("a"), std::string("b"), &cutest_test_a_b);
}
    static void cutest_test_a_b(){

}

TEST(suit, test1){
    CPU_ASSERT_EQ(5, 5, "shit!");
    CPU_ASSERT_EQ(8, 5, "shit!");
}

TEST(suit, test2){
    CPU_ASSERT_EQ(5, 5, "shit!");
}

TEST(suit2, test2){
    CPU_ASSERT_EQ(5, 5, "shit!");
}
TEST(suit2, test23){
    CPU_ASSERT_EQ(5, 5, "shit!");
}