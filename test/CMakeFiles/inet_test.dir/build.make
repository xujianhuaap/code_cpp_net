# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/xujianhua/Documents/soft/clion-2019.3.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/xujianhua/Documents/soft/clion-2019.3.3/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xujianhua/CLionProjects/code_cpp_net

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xujianhua/CLionProjects/code_cpp_net

# Include any dependencies generated for this target.
include test/CMakeFiles/inet_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/inet_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/inet_test.dir/flags.make

test/CMakeFiles/inet_test.dir/inet/main.cpp.o: test/CMakeFiles/inet_test.dir/flags.make
test/CMakeFiles/inet_test.dir/inet/main.cpp.o: test/inet/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xujianhua/CLionProjects/code_cpp_net/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/inet_test.dir/inet/main.cpp.o"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/inet_test.dir/inet/main.cpp.o -c /home/xujianhua/CLionProjects/code_cpp_net/test/inet/main.cpp

test/CMakeFiles/inet_test.dir/inet/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/inet_test.dir/inet/main.cpp.i"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xujianhua/CLionProjects/code_cpp_net/test/inet/main.cpp > CMakeFiles/inet_test.dir/inet/main.cpp.i

test/CMakeFiles/inet_test.dir/inet/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/inet_test.dir/inet/main.cpp.s"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xujianhua/CLionProjects/code_cpp_net/test/inet/main.cpp -o CMakeFiles/inet_test.dir/inet/main.cpp.s

# Object files for target inet_test
inet_test_OBJECTS = \
"CMakeFiles/inet_test.dir/inet/main.cpp.o"

# External object files for target inet_test
inet_test_EXTERNAL_OBJECTS =

test/inet_test: test/CMakeFiles/inet_test.dir/inet/main.cpp.o
test/inet_test: test/CMakeFiles/inet_test.dir/build.make
test/inet_test: test/CMakeFiles/inet_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xujianhua/CLionProjects/code_cpp_net/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable inet_test"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/inet_test.dir/link.txt --verbose=$(VERBOSE)
	cd /home/xujianhua/CLionProjects/code_cpp_net/test && ./inet_test

# Rule to build all files generated by this target.
test/CMakeFiles/inet_test.dir/build: test/inet_test

.PHONY : test/CMakeFiles/inet_test.dir/build

test/CMakeFiles/inet_test.dir/clean:
	cd /home/xujianhua/CLionProjects/code_cpp_net/test && $(CMAKE_COMMAND) -P CMakeFiles/inet_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/inet_test.dir/clean

test/CMakeFiles/inet_test.dir/depend:
	cd /home/xujianhua/CLionProjects/code_cpp_net && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xujianhua/CLionProjects/code_cpp_net /home/xujianhua/CLionProjects/code_cpp_net/test /home/xujianhua/CLionProjects/code_cpp_net /home/xujianhua/CLionProjects/code_cpp_net/test /home/xujianhua/CLionProjects/code_cpp_net/test/CMakeFiles/inet_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/inet_test.dir/depend
