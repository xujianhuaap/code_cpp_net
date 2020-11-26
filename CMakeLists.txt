cmake_minimum_required(VERSION 3.15)
project(code_cpp_net)

set(PROJECT_VERSION 1.0.1)
set(CMAKE_CXX_STANDARD 14)

# 指定输出 .so 动态库的目录位置
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
message(LIBRARY_OUTPUT_PATH -->，${LIBRARY_OUTPUT_PATH})

#指定输出 .a 静态库的目录位置　一般是归档文件
set(ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
message(ARCHIVE_OUTPUT_DIRECTORY -->，${ARCHIVE_OUTPUT_DIRECTORY})

#RUNTIME_OUTPUT_DIRECTORY
set(RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
message(RUNTIME_OUTPUT_DIRECTORY -->，${RUNTIME_OUTPUT_DIRECTORY})

SET(PROJECT_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
message(PROJECT_INCLUDE_DIR -->，${PROJECT_INCLUDE_DIR})

#必须在配置变量set之后才能生效
configure_file(config.h.in config.h @ONLY)


#include_directories([AFTER|BEFORE] [SYSTEM] dir1 [dir2 ...])
#AFTER 加到结尾　
include_directories(${PROJECT_INCLUDE_DIR})
# 由于配置文件config.h 存储在cmake-build-debug 文件中，必须通过include_directories,
# 其它地方才可以直接使用include<config.h>
include_directories(${CMAKE_CURRENT_BINARY_DIR})

include_directories(src/tools)



# 添加新的构建路径src
add_subdirectory(src)
add_executable(code_cpp_net project.cpp)
target_link_libraries(code_cpp_net tools)

