cmake_minimum_required(VERSION 2.8)
project (main)
SET(CMAKE_C_COMPILER "g++") 
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

option(MiniComplete_ENABLE_TESTING "Enable testing of the library." ON)

include(cmake/clang-cxx-dev-tools.cmake)
include(cmake/common.cmake)

#ADD_DEFINITIONS(-std=c++11 -g3 -W -Wall -pedantic -D_GNU_SOURCE)
#ADD_DEFINITIONS(-std=c99 -g -W)

# add the executable
add_executable(${PROJECT_NAME} main.cpp)
#target_link_libraries(${PROJECT_NAME} ${OPENSSL_LIBRARIES})

if (MiniComplete_ENABLE_TESTING)
  enable_testing()
  add_test(NAME ${PROJECT_NAME} COMMAND ${PROJECT_NAME})
  include(cmake/memory-check.cmake)
  add_subdirectory(test)
endif()

