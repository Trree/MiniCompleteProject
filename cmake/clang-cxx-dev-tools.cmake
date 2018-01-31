# ref: http://www.labri.fr/perso/fleury/posts/programming/using-clang-tidy-and-clang-format.html

# Additional targets to perform clang-format/clang-tidy
# Get all project files
file(GLOB
  ALL_CXX_SOURCE_FILES
  *.[chi]pp *.[chi]xx *.cc *.hh *.ii *.[CHI]
  )

# Adding clang-format target if executable is found
find_program(CLANG_FORMAT "clang-format")
if(CLANG_FORMAT)
  add_custom_target(
    clang-format
    COMMAND clang-format
    -i
    -style=file
    ${ALL_CXX_SOURCE_FILES}
  )
endif()




# Adding clang-tidy target if executable is found
find_program(CLANG_TIDY "clang-tidy")
if(CLANG_TIDY)
  message(STATUS "${clang_tidy_config}")
  add_custom_target(
    clang-tidy
    COMMAND clang-tidy ${ALL_CXX_SOURCE_FILES} -header-filter='.*'  -checks='*,-misc-macro-parentheses,-misc-definitions-in-headers,-misc-unused-parameters,-llvm-header-guard,-llvm-include-order,-google-readability-braces-around-statements,-google-runtime-references,-google-readability-todo,-google-build-using-namespace,-google-explicit-constructor,-cert-err58-cpp,-cppcoreguidelines-pro-type-vararg,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-cppcoreguidelines-pro-bounds-array-to-pointer-decay,-cppcoreguidelines-special-member-functions,-cppcoreguidelines-pro-type-reinterpret-cast,-cppcoreguidelines-pro-bounds-constant-array-index,-cppcoreguidelines-pro-type-member-init,-cppcoreguidelines-pro-type-union-access,-clang-analyzer-security.insecureAPI.strcpy,-modernize-use-nullptr,-modernize-use-equals-default,-modernize-loop-convert,-modernize-use-auto,-readability-braces-around-statements,-readability-named-parameter,-readability-else-after-return,-readability-redundant-declaration,-readability-implicit-bool-cast' -- -std=c++11
  )
endif()
