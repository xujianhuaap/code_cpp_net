//
// Created by xujianhua on 2020/11/25.
//

#include <iostream>

extern void warning(std::string &msg){
    time_t now{time(0)};
    tm *ltm = localtime(&now);

    printf("%d-%d-%d %d:%d:%d --【warning】-- %s",(ltm->tm_year+1900),ltm->tm_mon,ltm->tm_mday,ltm->tm_hour,
            ltm-> tm_min, ltm->tm_sec,msg.c_str());
}
