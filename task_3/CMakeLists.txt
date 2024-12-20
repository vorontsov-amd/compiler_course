cmake_minimum_required(VERSION 3.21)

project(ir-builder
    LANGUAGES C CXX)

if(${PROJECT_SOURCE_DIR} STREQUAL ${PROJECT_BINARY_DIR})
    message(FATAL_ERROR "In-source build is forbidden")
endif()

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -ggdb -fsanitize=address,undefined")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -ggdb -fsanitize=address,undefined")

find_package(LLVM REQUIRED)
find_package(SDL2 REQUIRED)
include_directories(ir_builder ${SDL2_INCLUDE_DIRS})

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

set(SOURCE_DIR ${PROJECT_SOURCE_DIR}/src)

add_executable(ir_builder ${SOURCE_DIR}/main.cpp ${SOURCE_DIR}/app/sdl.c)
target_include_directories(ir_builder PRIVATE ${LLVM_INCLUDE_DIRS})
target_link_libraries(ir_builder PRIVATE LLVM)
target_link_libraries(ir_builder PRIVATE ${SDL2_LIBRARIES})
set_target_properties(ir_builder PROPERTIES
    CXX_STANDARD 23
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF)