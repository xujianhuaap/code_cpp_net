//
// Created by xujianhua on 2020/11/25.
//

#include <iostream>
#include <config.h>
#include <Net.h>

int main(int argc, char* argv[]){
    std::cout << "hello world Project Version " << PROJECT_VERSION << std::endl;
    if(argc > 2){
        std::string msg = "parameter more than 2";
        warning(msg);
    }
    return 0;
}