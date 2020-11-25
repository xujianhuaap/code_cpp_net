//
// Created by xujianhua on 2020/11/25.
//

#include <iostream>
#include "Log.h"

void warning(std::string &msg){
    time_t now{time(0)};
    tm *ltm = localtime(&now);

    std::cout << ltm->tm_year << '-'<< ltm->tm_mon << '-' << ltm->tm_mday<< ' '
    << ltm->tm_hour << ':'<< ltm->tm_min << ':'<< ltm->tm_sec << " ---> "
    << msg  << std::endl;
}
