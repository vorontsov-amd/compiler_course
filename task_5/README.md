## LLVM based compiller 

This directory contains the repository with the fifth assignment of the LLVM course. You can find the source code for this assignment in the [`Compiller` repository in the `llvm` branch](https://github.com/vorontsov-amd/Compiller/tree/llvm). If you go there, in the `src` and `include` subdirectories you will find the source code of the compiler. In the sim.amd file, you can find a program with a graphical application exactly like the application from the first assignment. If you open this file, you will see something scary. The first 7000 lines in the file are a representation of an RGB picture as an array of numbers.

Some of the code was written back in the first semester, so if you cringe when reading the code, that's okay.

## Library dependencies: 
* boost
* llvm
* SDL2

## Installing

```bash
git clone https://github.com/vorontsov-amd/Compiller.git
cd Compiller
git switch llvm
git submodule init && git submodule update
```

## Building
```bash
cmake -B build
cmake --build build
```

## Runing
```bash
./build/bin/Compiller sim.amd
./sim.out
```