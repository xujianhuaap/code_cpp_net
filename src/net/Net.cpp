//
// Created by xujianhua on 2020/12/13.
//

#include <netdb.h>
#include <cstdio>
#include <arpa/inet.h>
#include "Net.h"

extern void printHostEntryInfo(hostent* host){

    auto host_name = host->h_name;
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
            printf("host entry addr type is AF_INET");
            for(char** pptr1 = host->h_addr_list;pptr1 != NULL, pptr1 ++;){
                if(*pptr1 == NULL){
                    break;
                }
                printf("host entry address  %s\n",inet_ntoa(*(struct in_addr*) pptr1 ));
            }
            break;
    }

}
