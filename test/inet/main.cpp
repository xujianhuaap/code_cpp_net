//
// Created by xujianhua on 2020/12/3.
//

#include <cstdio>
#include "CppUTest/TestHarness.h"
#include "CppUTest/CommandLineTestRunner.h"

TEST_GROUP(INet){
//    static int output_method(const char* method,...){
//
//    }
//    void setup(){
//
//    }
//
//    void teardown(){
//
//    }
};

TEST(INet,hello){
    CHECK_EQUAL("HELLO","HELLO");
};
int main(int argumentCount,char** arguments){
    printf("start test for inet");
    return CommandLineTestRunner::RunAllTests(argumentCount,arguments);
}