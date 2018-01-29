# ref: https://lefticus.gitbooks.io/cpp-best-practices/content/02-Use_the_Tools_Available.html
# -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic
#    -Wall -Wextra reasonable and standard
#    -Wshadow warn the user if a variable declaration shadows one from a parent context
#    -Wnon-virtual-dtor warn the user if a class with virtual functions has a non-virtual destructor. This helps catch hard to track down memory errors
#    -Wold-style-cast warn for c-style casts
#    -Wcast-align warn for potential performance problem casts
#    -Wunused warn on anything being unused
#    -Woverloaded-virtual warn if you overload (not override) a virtual function
#    -Wpedantic warn if non-standard C++ is used
#    -Wconversion warn on type conversions that may lose data
#    -Wsign-conversion warn on sign conversions
#    -Wmisleading-indentation warn if identation implies blocks where blocks do not exist
#    -Wduplicated-cond warn if if / else chain has duplicated conditions
#    -Wduplicated-branches warn if if / else branches have duplicated code
#    -Wlogical-op warn about logical operations being used where bitwise were probably wanted
#    -Wnull-dereference warn if a null dereference is detected
#    -Wuseless-cast warn if you perform a cast to the same type
#    -Wdouble-promotion warn if float is implicit promoted to double
#    -Wformat=2 warn on security issues around functions that format output (ie printf)
#       Consider using -Weverything and disabling the few warnings you need to on Clang
#    -Weffc++ warning mode can be too noisy, but if it works for your project, use it also.
##


ADD_DEFINITIONS(
-Wall
-Wextra 
-Wshadow 
-Wnon-virtual-dtor 
-Wold-style-cast
-Wcast-align
-Wunused
-Woverloaded-virtual
-Wpedantic
-Wconversion
-Wsign-conversion
-Wmisleading-indentation
-Wduplicated-cond
-Wduplicated-branches
-Wlogical-op 
-Wnull-dereference
-Wuseless-cast
-Wdouble-promotion
-Wformat=2
-Weffc++
-pedantic
)

