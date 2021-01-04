### 工程目录说明
#### CMakeList.txt文件
- 用于构建系统
#### README描述文件
- 工程描述文件
#### src目录
- 放置源代码
#### include 
- src依赖的.h文件
- 别人要用的.h文件放到include目录下
#### lib /dll
- lib放置静态库文件
- dll 放置动态库文件
- 动态库比静态库从编译的角度来看，多了宏定义；静态库不需要导出函数，
直接编译在二进制文件中；动态库需要导出函数
#### bin 目录
- 放置产生的二进制文件
#### builds
- 提供各种平台的构建环境

### 构建说明
- 始终要考虑是库，还是应用

### build->install script
```
./package.sh \
    -p  /home/xu/Documents/codes/codes_c/code_cpp_net \
     -c /home/xu/Documents/soft/clion-2019.3.1/bin/cmake/linux/bin/cmake 
```

