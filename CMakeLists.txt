cmake_minimum_required(VERSION 3.10)
project(hello_ci)
add_executable(hello_ci src/main.cpp)
add_executable(runTests src/test.cpp)
target_link_libraries(runTests gtest gtest_main pthread)
add_test(NAME runTests COMMAND runTests)
enable_testing()

