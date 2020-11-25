cmake_minimum_required(VERSION 3.15)
project(code_cpp_net)

set(PROJECT_VERSION 1.0.1)
set(CMAKE_CXX_STANDARD 14)

#必须在配置变量set之后才能生效
configure_file(config.h.in config.h @ONLY)


#include_directories([AFTER|BEFORE] [SYSTEM] dir1 [dir2 ...])
#AFTER 加到结尾　
include_directories(include)
include_directories(${CMAKE_CURRENT_BINARY_DIR})


# 指定输出 .so 动态库的目录位置
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

add_subdirectory(src)
add_executable(code_cpp_net project.cpp)

