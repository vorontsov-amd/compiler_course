cmake_minimum_required(VERSION 3.29)
project(SDLApp)

set(CMAKE_CXX_STANDARD 23)

find_package(SDL2 REQUIRED)
include_directories(${PROJECT_NAME} ${SDL2_INCLUDE_DIRS})

add_executable(test main.cpp sdl.cpp)
target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARIES})
