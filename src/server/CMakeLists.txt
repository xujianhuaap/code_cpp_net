
add_library(libtools SHARED IMPORTED)
set_target_properties(libtools PROPERTIES IMPORTED_LOCATION ${ARCHIVE_OUTPUT_DIRECTORY}/libtools.so)
add_executable(server main.cpp)

#target_include_directories(server PUBLIC "${CMAKE_ROOT_BINARY_DIR}")
target_include_directories(server PUBLIC "${PROJECT_INCLUDE_DIR}")
target_link_libraries(server PUBLIC libtools)