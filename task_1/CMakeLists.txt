cmake_minimum_required(VERSION 3.27)
project(SDLApp)

set(CMAKE_CXX_STANDARD 17)

find_package(SDL2 REQUIRED)
include_directories(${PROJECT_NAME} ${SDL2_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} src/main.cpp src/sdl.cpp)
target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARIES})
