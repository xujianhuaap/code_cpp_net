SET(SRC_LIST  client)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(client main.cpp)

# 添加依赖库
#target_link_libraries(<target>
#                      <PRIVATE|PUBLIC|INTERFACE> <item>...
#                     [<PRIVATE|PUBLIC|INTERFACE> <item>...]...)
#　引用库文件的文件称为源文件；如果只有源文件包含库头文件，选择PRIVATE
# 如果只有源头文件包含库头文件，选择INTERFACE
# 如果源头文件和源文件都包含库头文件　选择PUBLIC
target_link_libraries(client tools )