# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/eric/Documents/compiler_design/beaker

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/eric/Documents/compiler_design/beaker/build

# Include any dependencies generated for this target.
include beaker/CMakeFiles/beaker-compile.dir/depend.make

# Include the progress variables for this target.
include beaker/CMakeFiles/beaker-compile.dir/progress.make

# Include the compile flags for this target's objects.
include beaker/CMakeFiles/beaker-compile.dir/flags.make

beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o: beaker/CMakeFiles/beaker-compile.dir/flags.make
beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o: ../beaker/compiler.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/eric/Documents/compiler_design/beaker/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o"
	cd /home/eric/Documents/compiler_design/beaker/build/beaker && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/beaker-compile.dir/compiler.cpp.o -c /home/eric/Documents/compiler_design/beaker/beaker/compiler.cpp

beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/beaker-compile.dir/compiler.cpp.i"
	cd /home/eric/Documents/compiler_design/beaker/build/beaker && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/eric/Documents/compiler_design/beaker/beaker/compiler.cpp > CMakeFiles/beaker-compile.dir/compiler.cpp.i

beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/beaker-compile.dir/compiler.cpp.s"
	cd /home/eric/Documents/compiler_design/beaker/build/beaker && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/eric/Documents/compiler_design/beaker/beaker/compiler.cpp -o CMakeFiles/beaker-compile.dir/compiler.cpp.s

beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.requires:
.PHONY : beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.requires

beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.provides: beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.requires
	$(MAKE) -f beaker/CMakeFiles/beaker-compile.dir/build.make beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.provides.build
.PHONY : beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.provides

beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.provides.build: beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o

# Object files for target beaker-compile
beaker__compile_OBJECTS = \
"CMakeFiles/beaker-compile.dir/compiler.cpp.o"

# External object files for target beaker-compile
beaker__compile_EXTERNAL_OBJECTS =

beaker/beaker-compile: beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o
beaker/beaker-compile: beaker/CMakeFiles/beaker-compile.dir/build.make
beaker/beaker-compile: /usr/lib/x86_64-linux-gnu/libboost_system.so
beaker/beaker-compile: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
beaker/beaker-compile: /usr/lib/llvm-3.5/lib/libLLVMCore.a
beaker/beaker-compile: /usr/lib/llvm-3.5/lib/libLLVMSupport.a
beaker/beaker-compile: lingo/lingo/liblingo.a
beaker/beaker-compile: beaker/libbeaker.a
beaker/beaker-compile: /usr/lib/x86_64-linux-gnu/libgmp.so
beaker/beaker-compile: /usr/lib/x86_64-linux-gnu/libboost_system.so
beaker/beaker-compile: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
beaker/beaker-compile: beaker/CMakeFiles/beaker-compile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable beaker-compile"
	cd /home/eric/Documents/compiler_design/beaker/build/beaker && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/beaker-compile.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
beaker/CMakeFiles/beaker-compile.dir/build: beaker/beaker-compile
.PHONY : beaker/CMakeFiles/beaker-compile.dir/build

beaker/CMakeFiles/beaker-compile.dir/requires: beaker/CMakeFiles/beaker-compile.dir/compiler.cpp.o.requires
.PHONY : beaker/CMakeFiles/beaker-compile.dir/requires

beaker/CMakeFiles/beaker-compile.dir/clean:
	cd /home/eric/Documents/compiler_design/beaker/build/beaker && $(CMAKE_COMMAND) -P CMakeFiles/beaker-compile.dir/cmake_clean.cmake
.PHONY : beaker/CMakeFiles/beaker-compile.dir/clean

beaker/CMakeFiles/beaker-compile.dir/depend:
	cd /home/eric/Documents/compiler_design/beaker/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/eric/Documents/compiler_design/beaker /home/eric/Documents/compiler_design/beaker/beaker /home/eric/Documents/compiler_design/beaker/build /home/eric/Documents/compiler_design/beaker/build/beaker /home/eric/Documents/compiler_design/beaker/build/beaker/CMakeFiles/beaker-compile.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : beaker/CMakeFiles/beaker-compile.dir/depend
