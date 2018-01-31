#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

long long fib(int n);

// It would be overflow_error
long long fib(int n) {
  const double sqrt5 = std::sqrt(5);
  const double phi = (1 + sqrt5) / 2;
  return static_cast<long long>(std::pow(phi, n+1) / sqrt5 + 0.5);
}

TEST_CASE("testing the fibonacci function") {
    CHECK(fib(0) == 1);
    CHECK(fib(1) == 1);
    CHECK(fib(2) == 2);
    CHECK(fib(3) == 3);
    CHECK(fib(10) == 89);
    CHECK(fib(50) == 20365011074);
}
