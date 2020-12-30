

# 指定生成动态库
# add_library(<name> [STATIC | SHARED | MODULE]
#            [EXCLUDE_FROM_ALL]
#            [<source>...])
# STATIC 是归档文件链接其他目标时候使用　产生.文件
#　SHARED 是在运行的时候动态链接和加载  产生.so文件
#　MODULE 不链接其他目标的插件，但在运行的时候使用dlopen-like的方法动态加载
add_library(tools SHARED Log.cpp)
# 指定生成版本号，VERSION指代动态库版本，SOVERSION指代API版本
# SET_TARGET_PROPERTIES(tools PROPERTIES VERSION 1.2 SOVERSION 1)

if(INSTALL_LIB)
install(TARGETS tools LIBRARY DESTINATION lib)
endif(INSTALL_LIB)
#install(FILES Log.h DESTINATION include)