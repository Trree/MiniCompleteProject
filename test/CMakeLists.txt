# add the executable
add_executable(unittest hello_world.cpp)

add_test(NAME MiniComplete.unittest COMMAND unittest)
