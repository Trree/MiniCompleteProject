function(add_memcheck_test name binary)
  set(memcheck_command "${MEMORYCHECK_COMMAND} ${CMAKE_MEMORYCHECK_COMMAND_OPTIONS}")
  separate_arguments(memcheck_command)
  add_test(${name} ${binary} ${ARGN})
  add_test(memcheck_${name} ${memcheck_command} ./${binary} ${ARGN})
endfunction(add_memcheck_test)

function(set_memcheck_test_properties name)
  set_tests_properties(${name} ${ARGN})
  set_tests_properties(memcheck_${name} ${ARGN})
endfunction(set_memcheck_test_properties)


# valgrind --tool=memcheck --leak-check=yes ./main
find_program( MEMORYCHECK_COMMAND "valgrind" )
message(STATUS "MEMORYCHECK_COMMAND: ${MEMORYCHECK_COMMAND}")
if(MEMORYCHECK_COMMAND)
  set(CMAKE_MEMORYCHECK_COMMAND_OPTIONS "--trace-children=yes --leak-check=full")
  add_memcheck_test("valgrind" ${PROJECT_NAME})
  add_custom_target(
    valgrind 
    COMMAND valgrind --trace-children=yes --leak-check=full ./${PROJECT_NAME} ${ARGN}
  )
endif()
