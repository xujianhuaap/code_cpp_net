//
// Created by xujianhua on 2020/12/3.
//

#include <cstdio>
#include <arpa/inet.h>
#include <strings.h>
#include "CppUTest/TestHarness.h"
#include "CppUTest/CommandLineTestRunner.h"

const char* ip;
TEST_GROUP(INet){
//    static int output_method(const char* method,...){
//
//    }
    void setup(){
        ip = "127.0.0.1";
    }

    void teardown(){
        ip = "";
    }
};

TEST(INet,inet_pton){
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_family=AF_INET;
    inet_pton(AF_INET,ip,&address.sin_addr);//转成网络字节序 uint32

    printf( "address ip is 【%s】", inet_ntoa(address.sin_addr));
    printf("ip host byte order 【%d】,net byte order 【%d】\n",ntohl(address.sin_addr.s_addr)
            ,address.sin_addr.s_addr);
    CHECK_EQUAL(2130706433,ntohl(address.sin_addr.s_addr));
};
int main(int argumentCount,char** arguments){
    printf("start test for inet\n");
    return CommandLineTestRunner::RunAllTests(argumentCount,arguments);
}