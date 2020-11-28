# add_library(<name> <type> IMPORTED [GLOBAL])
add_library(libtools SHARED IMPORTED)
# set_target_properties(target1 target2 ...
#        PROPERTIES prop1 value1
#        prop2 value2 ...)
set_target_properties( libtools
PROPERTIES IMPORTED_LOCATION ${ARCHIVE_OUTPUT_DIRECTORY}/libtools.so)

add_executable(application project.cpp)
target_include_directories(application PUBLIC "${PROJECT_INCLUDE_DIR}")
target_include_directories(application PUBLIC "${CMAKE_ROOT_BINARY_DIR}")
target_link_libraries(application libtools)