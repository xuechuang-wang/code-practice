# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wxc/Documents/agx_sdk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wxc/Documents/agx_sdk/build

# Include any dependencies generated for this target.
include apps/CMakeFiles/app_CSMC_Luo.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include apps/CMakeFiles/app_CSMC_Luo.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/app_CSMC_Luo.dir/progress.make

# Include the compile flags for this target's objects.
include apps/CMakeFiles/app_CSMC_Luo.dir/flags.make

apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o: apps/CMakeFiles/app_CSMC_Luo.dir/flags.make
apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o: ../apps/bunker_demo/bunker_CSMC_LuoXuan.cpp
apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o: apps/CMakeFiles/app_CSMC_Luo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wxc/Documents/agx_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o"
	cd /home/wxc/Documents/agx_sdk/build/apps && /bin/g++-9 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o -MF CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o.d -o CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o -c /home/wxc/Documents/agx_sdk/apps/bunker_demo/bunker_CSMC_LuoXuan.cpp

apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.i"
	cd /home/wxc/Documents/agx_sdk/build/apps && /bin/g++-9 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wxc/Documents/agx_sdk/apps/bunker_demo/bunker_CSMC_LuoXuan.cpp > CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.i

apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.s"
	cd /home/wxc/Documents/agx_sdk/build/apps && /bin/g++-9 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wxc/Documents/agx_sdk/apps/bunker_demo/bunker_CSMC_LuoXuan.cpp -o CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.s

# Object files for target app_CSMC_Luo
app_CSMC_Luo_OBJECTS = \
"CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o"

# External object files for target app_CSMC_Luo
app_CSMC_Luo_EXTERNAL_OBJECTS =

bin/app_CSMC_Luo: apps/CMakeFiles/app_CSMC_Luo.dir/bunker_demo/bunker_CSMC_LuoXuan.cpp.o
bin/app_CSMC_Luo: apps/CMakeFiles/app_CSMC_Luo.dir/build.make
bin/app_CSMC_Luo: lib/libwrp_sdk.a
bin/app_CSMC_Luo: apps/CMakeFiles/app_CSMC_Luo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wxc/Documents/agx_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/app_CSMC_Luo"
	cd /home/wxc/Documents/agx_sdk/build/apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/app_CSMC_Luo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/CMakeFiles/app_CSMC_Luo.dir/build: bin/app_CSMC_Luo
.PHONY : apps/CMakeFiles/app_CSMC_Luo.dir/build

apps/CMakeFiles/app_CSMC_Luo.dir/clean:
	cd /home/wxc/Documents/agx_sdk/build/apps && $(CMAKE_COMMAND) -P CMakeFiles/app_CSMC_Luo.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/app_CSMC_Luo.dir/clean

apps/CMakeFiles/app_CSMC_Luo.dir/depend:
	cd /home/wxc/Documents/agx_sdk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wxc/Documents/agx_sdk /home/wxc/Documents/agx_sdk/apps /home/wxc/Documents/agx_sdk/build /home/wxc/Documents/agx_sdk/build/apps /home/wxc/Documents/agx_sdk/build/apps/CMakeFiles/app_CSMC_Luo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/CMakeFiles/app_CSMC_Luo.dir/depend

