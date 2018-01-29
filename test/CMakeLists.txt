cmake_minimum_required(VERSION 2.8)
project (main)
SET(CMAKE_C_COMPILER "g++") 
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

ADD_DEFINITIONS(-std=c++11 -g3 -W -Wall -pedantic -D_GNU_SOURCE)
#ADD_DEFINITIONS(-std=c99 -g -W)

# add the executable
add_executable(${PROJECT_NAME} hello_world.cpp)



