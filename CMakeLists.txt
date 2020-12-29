cmake_minimum_required(VERSION 3.15)
project(code_cpp_net)

set(PROJECT_VERSION 1.0.1)
set(CMAKE_CXX_STANDARD 14)
set(APP_NAME inet)

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

set(CMAKE_ROOT_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
message(CMAKE_ROOT_BINARY_DIR -->，${CMAKE_ROOT_BINARY_DIR})

#必须在配置变量set之后才能生效
configure_file(config.h.in config.h @ONLY)

SET(CPACK_POST_BUILD_SCRIPTS "post.sh")


#include_directories([AFTER|BEFORE] [SYSTEM] dir1 [dir2 ...])
#AFTER 加到结尾　
include_directories(src/tools)
include_directories(src/net)
# 由于配置文件config.h 存储在cmake-build-debug 文件中，必须通过include_directories,
# 其它地方才可以直接使用include<config.h>
#include_directories(${CMAKE_CURRENT_BINARY_DIR})


# 添加新的构建路径src
#add_subdirectory(source_dir [binary_dir] [EXCLUDE_FROM_ALL])
# binary_dir 表示构建之后输出文件的目录
add_subdirectory(src/application)
add_subdirectory(src/tools)
add_subdirectory(src/client)
add_subdirectory(src/server)
add_subdirectory(src/net)

option(COMPILE_TESTS "Compile the tests" ON)
if(COMPILE_TESTS)
    add_subdirectory(test)
endif(COMPILE_TESTS)


include(deb.cmake)

