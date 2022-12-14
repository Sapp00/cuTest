//
// Created by Maurice on 05.12.2022.
//

#ifndef CUTESTALL_CUTEST_MAIN_H
#define CUTESTALL_CUTEST_MAIN_H

#include <cstdio>
#include "cuTest.cuh"

int main(int argc, char **argv) {
    printf("Running main() from %s\n", __FILE__);
    //testing::InitGoogleTest(&argc, argv);
    //return RUN_ALL_TESTS();

    cuTest::executeTests();
}

#endif //CUTESTALL_CUTEST_MAIN_H
