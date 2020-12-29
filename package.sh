#!/bin/bash

# init data
project_dir=/home/xujianhua/CLionProjects/code_cpp_net
project_build="${project_dir}/build"
cmake_path=/home/xujianhua/Documents/soft/clion-2019.3.3/bin/cmake/linux/

# build project
${cmake_path}/bin/cmake -DCMAKE_BUILD_TYPE=Debug\
  -DMAKE_BUILD_TYPE=Debug -DCOMPILE_TESTS=ON\
   -G "CodeBlocks - Unix Makefiles"\
   -S ${project_dir}\
   -B ${project_build}

cd ${project_build}
make package