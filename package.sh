#!/bin/bash
while getopts ":p:c:" opt
do
    case $opt in
        p)
        echo "project_dir --> $OPTARG"
        project_dir="$OPTARG"
        ;;
         c)
        echo "cmake_path --> $OPTARG"
        cmake_path="$OPTARG"
        ;;
        ?)
        echo "未知参数"
        exit 1;;
    esac
done
# init data
project_build="${project_dir}/build"
project_lib="${project_dir}/lib"
cpack_config_file="${project_build}/CPackConfig.cmake"
cpack_source_config_file="${project_build}/CPackSourceConfig.cmake"

# clean build
if test -d "${project_build}";then
  echo "---> clean build"
  rm -rf ${project_build}
fi

# build project
${cmake_path} -DCMAKE_BUILD_TYPE=Debug\
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

# add share library path
echo "---- add share library path---"
matchTarget=/usr/local/lib
matchStr=$(grep -i "${matchTarget}" /etc/ld.so.conf -o)
if test -z "${matchStr}";
then
  echo "append ${matchTarget} to /etc/ld.so.conf"
  sudo sh  -c "echo ${matchTarget} >> /etc/ld.so.conf"
else
  echo "${matchStr}"
fi
sudo ldconfig
echo "---- add share library path ${count}---"
# install system
# delete old lib target
for f in "${project_lib}"
do
  fName=$(basename "${f}")
  echo "current project lib-->${fName}"
  for libF in /usr/local/lib/*.so
   do
    innerFName=$(basename "${libF}")
      echo "usr/local/lib-->${innerFName}"
    if [ "${fName}" == "${innerFName}" ];then
      echo "usr/local/lib===> ${libF}"
      sudo rm -rf "${libF}"
      fi
  done

done

cd ${project_build}
sudo make install