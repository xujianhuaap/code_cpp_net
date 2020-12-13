#include <iostream>
#include <signal.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <Net.h>


static auto stop = false;
static void handle_term(int sig){
    stop = true;
}


/***
 *  在IDE run 配置参数
 * @param argc
 * @param argv
 * @return
 */

#define BUF_SIZE 1024*10
int main(int argc, char* argv[]) {
    std::cout << "Hello, World!" << std::endl;
    signal(SIGTERM, handle_term);
    if(argc < 3){
        std::string msg= "parameter too less";
        warning(msg);
        return 1;
    }

    const char*ip = argv[1];
    int port = atoi(argv[2]);// 字符串转成整型
    int backlog = atoi(argv[3]);

    int sock = socket(PF_INET, SOCK_STREAM,0);
    assert(sock >= 0);
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_family = AF_INET;
    inet_pton(AF_INET,ip,&address.sin_addr);
    address.sin_port = htons(port);

    int result = bind(sock,(struct sockaddr*)&address, sizeof(address));
    assert(result != -1);

    result = listen(sock,backlog);
    assert(result != -1);

    while (!stop){
        struct sockaddr_in client;
        socklen_t  client_addrLen = sizeof(client);
        int connfd = accept(sock, (struct sockaddr*)&client,&client_addrLen);

        printf("current conn %d\n",connfd);

        if(connfd < 0){
            std::string msg ="server accept conn failure";
            warning(msg);
        } else{

            printf("client ip 【%s】, port 【%d】\n",inet_ntoa(client.sin_addr),ntohs(client.sin_port));

            printf("accept new connect \n");
            char buffer[BUF_SIZE];
            memset(buffer,'\0',BUF_SIZE);
            while (true){
                if(sockatmark(connfd) == 1){
                    result = recv(connfd,buffer, BUF_SIZE-1,MSG_OOB);
                    printf(" OOB data 【%s】 will arrive\n",buffer);
                    break;
                } else{
                    result = recv(connfd,buffer, BUF_SIZE-1,0);
                }

                if(result == -1){
                    printf(" receive err\n");
                    break;
                }

                if(result == 0){
                    break;
                }

                if(result > 0){
                    printf("receive %d byte of normal data '%s'\n",result,buffer);
                }
                memset(buffer,'\0',BUF_SIZE);
                sleep(4);
            }

            close(connfd);
            printf("close current conn\n\n\n");
        }

        sleep(1);
    }

    close(sock);
    return 0;
}


