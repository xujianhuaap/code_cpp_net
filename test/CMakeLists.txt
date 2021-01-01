

#if(DEFINED ENV{CPPUTEST_HOME})
#    message(STATUS "Using CppUTest home: $ENV{CPPUTEST_HOME}")
#    set(CPPUTEST_INCLUDE_DIRS $ENV{CPPUTEST_HOME}/include)
#    set(CPPUTEST_LIBRARIES $ENV{CPPUTEST_HOME}/lib)
#    set(CPPUTEST_LDFLAGS CppUTest CppUTestExt)
#else()
#    find_package(PkgConfig REQUIRED)
#    pkg_search_module(CPPUTEST REQUIRED cpputest>=3.8)
#    message(STATUS "Found CppUTest version ${CPPUTEST_VERSION}")
#endif()

find_package(PkgConfig 0.29.1 REQUIRED MODULE)
message("-- CMAKE_MODULE_PATH " ${CMAKE_MODULE_PATH})
message("-- is installed PkgConfig " ${PkgConfig_FOUND})
pkg_search_module(CPPUTEST REQUIRED cpputest>=3.8)
message(STATUS "Found CppUTest version ${CPPUTEST_VERSION}")



set(TEST_APP_NAME ${APP_NAME}_test)
set(TEST_SOURCES inet/main.cpp)

# (3) Take care of include directories
include_directories(${PROJECT_INCLUDE_DIR})
link_directories(${CPPUTEST_LIBRARIES})
# (4) Build the unit tests objects and link then with the app library
add_executable(${TEST_APP_NAME} ${TEST_SOURCES})
target_link_libraries(${TEST_APP_NAME} ${CPPUTEST_LDFLAGS})
target_link_libraries(${TEST_APP_NAME} net)
# (5) Run the test once the build is done
add_custom_command(TARGET ${TEST_APP_NAME} COMMAND ./${TEST_APP_NAME} POST_BUILD)

