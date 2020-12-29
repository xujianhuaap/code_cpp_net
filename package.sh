#!/bin/bash

# init data
project_dir=/home/xujianhua/CLionProjects/code_cpp_net
project_build="${project_dir}/build"
cmake_path=/home/xujianhua/Documents/soft/clion-2019.3.3/bin/cmake/linux/
cpack_config_file="${project_build}/CPackConfig.cmake"
cpack_source_config_file="${project_build}/CPackSourceConfig.cmake"

# clean build
if test -d "${project_build}";then
  echo "---> clean build"
  rm -rf ${project_build}
fi

# build project
${cmake_path}/bin/cmake -DCMAKE_BUILD_TYPE=Debug\
  -DMAKE_BUILD_TYPE=Debug -DCOMPILE_TESTS=ON\
   -G "CodeBlocks - Unix Makefiles"\
   -S ${project_dir}\
   -B ${project_build}

# generate package and list deb package detail info
if test -f "${cpack_config_file}";then
  cd ${project_build}
  make package
  dpkg-deb -c *.deb
fi
