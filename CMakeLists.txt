cmake_minimum_required(VERSION 2.8)
project (main)
SET(CMAKE_C_COMPILER "g++") 
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)
# configure a header file to pass some of the CMake settings
# to the source code
#configure_file (
#"${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
#"${PROJECT_BINARY_DIR}/share/tcp_server.h"
#
#)

#set(OPENSSL_ROOT_DIR /usr/local/ssl)
#find_package(OpenSSL 1.0 REQUIRED)
#message(STATUS "OpenSSL include directory: " ${OPENSSL_INCLUDE_DIR})
#message(STATUS "OpenSSL library: " ${OPENSSL_LIBRARIES})
#include_directories(${OPENSSL_INCLUDE_DIR})

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
ADD_DEFINITIONS(-std=c++11 -g3 -W -Wall -pedantic -D_GNU_SOURCE)
#ADD_DEFINITIONS(-std=c99 -g -W)

# add the executable
add_executable(${PROJECT_NAME} main.cpp)
#target_link_libraries(${PROJECT_NAME} ${OPENSSL_LIBRARIES})
