//
// Created by xujianhua on 2020/12/3.
//

#include <cstdio>
#include <arpa/inet.h>
#include <strings.h>
#include <netdb.h>
#include "CppUTest/TestHarness.h"
#include "CppUTest/CommandLineTestRunner.h"

const char* ip;
const char* hostName;
TEST_GROUP(INet){

    void setup(){
        ip = "127.0.0.1";
        hostName ="www.csair.com";
    }

    void teardown(){
        ip = "";
    }
};

TEST(INet,inet_pton){
    printf("\n======== test inet_pton ====\n ");
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_family=AF_INET;
    inet_pton(AF_INET,ip,&address.sin_addr);//转成网络字节序 uint32

    printf( "address ip is 【%s】", inet_ntoa(address.sin_addr));
    printf("ip host byte order 【%d】,net byte order 【%d】\n",ntohl(address.sin_addr.s_addr)
            ,address.sin_addr.s_addr);
    CHECK_EQUAL(2130706433,ntohl(address.sin_addr.s_addr));
};

TEST(INet,gethostent){
    printf("\n======== test gethostent ====\n ");
    hostent* host = gethostbyname(hostName);
    auto host_name = host->h_name;
    char buf[32]={0};
    CHECK_TRUE(host_name != NULL);
    printf("host official name %s\n",host_name);

    for(char **pptr=host->h_aliases;pptr != NULL;pptr ++){
        if(*pptr == NULL){
            break;
        }
        printf("host entry alias %s\n",*pptr);
    }

    switch (host->h_addrtype){
        case AF_INET:
        case AF_INET6:
            for(char** pptr1 = host->h_addr_list;pptr1 != NULL, pptr1 ++;){
                if(*pptr1 == NULL){
                    printf("host has no addr \n");
                    break;
                }
                printf("host entry address  %s\n",inet_ntoa(*(struct in_addr*) pptr1 ));

            }
            break;
    }

    CHECK_EQUAL(4, host->h_length);
}
int main(int argumentCount,char** arguments){
    printf("start test for inet\n");
    return CommandLineTestRunner::RunAllTests(argumentCount,arguments);
}