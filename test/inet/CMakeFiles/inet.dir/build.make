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
include test/inet/CMakeFiles/inet.dir/depend.make

# Include the progress variables for this target.
include test/inet/CMakeFiles/inet.dir/progress.make

# Include the compile flags for this target's objects.
include test/inet/CMakeFiles/inet.dir/flags.make

test/inet/CMakeFiles/inet.dir/main.cpp.o: test/inet/CMakeFiles/inet.dir/flags.make
test/inet/CMakeFiles/inet.dir/main.cpp.o: test/inet/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xujianhua/CLionProjects/code_cpp_net/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/inet/CMakeFiles/inet.dir/main.cpp.o"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test/inet && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/inet.dir/main.cpp.o -c /home/xujianhua/CLionProjects/code_cpp_net/test/inet/main.cpp

test/inet/CMakeFiles/inet.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/inet.dir/main.cpp.i"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test/inet && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xujianhua/CLionProjects/code_cpp_net/test/inet/main.cpp > CMakeFiles/inet.dir/main.cpp.i

test/inet/CMakeFiles/inet.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/inet.dir/main.cpp.s"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test/inet && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xujianhua/CLionProjects/code_cpp_net/test/inet/main.cpp -o CMakeFiles/inet.dir/main.cpp.s

# Object files for target inet
inet_OBJECTS = \
"CMakeFiles/inet.dir/main.cpp.o"

# External object files for target inet
inet_EXTERNAL_OBJECTS =

test/inet/inet: test/inet/CMakeFiles/inet.dir/main.cpp.o
test/inet/inet: test/inet/CMakeFiles/inet.dir/build.make
test/inet/inet: test/inet/CMakeFiles/inet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xujianhua/CLionProjects/code_cpp_net/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable inet"
	cd /home/xujianhua/CLionProjects/code_cpp_net/test/inet && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/inet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/inet/CMakeFiles/inet.dir/build: test/inet/inet

.PHONY : test/inet/CMakeFiles/inet.dir/build

test/inet/CMakeFiles/inet.dir/clean:
	cd /home/xujianhua/CLionProjects/code_cpp_net/test/inet && $(CMAKE_COMMAND) -P CMakeFiles/inet.dir/cmake_clean.cmake
.PHONY : test/inet/CMakeFiles/inet.dir/clean

test/inet/CMakeFiles/inet.dir/depend:
	cd /home/xujianhua/CLionProjects/code_cpp_net && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xujianhua/CLionProjects/code_cpp_net /home/xujianhua/CLionProjects/code_cpp_net/test/inet /home/xujianhua/CLionProjects/code_cpp_net /home/xujianhua/CLionProjects/code_cpp_net/test/inet /home/xujianhua/CLionProjects/code_cpp_net/test/inet/CMakeFiles/inet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/inet/CMakeFiles/inet.dir/depend

