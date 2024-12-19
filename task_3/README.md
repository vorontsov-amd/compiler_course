# IR generator

This directory contains the repository with the third assignment of the LLVM course. The `src` subdirectory contains the original versions of IR generator, but the latest version is in the [`Compiller` repository in the `ir-interpreter` branch](https://github.com/vorontsov-amd/Compiller/tree/ir-interpreter). If you go there, in the `ir-interpreter` directory you will find the ir generator and interpreter for the generated LLVM IR.

Some of the code was written back in first semester, so if you cringe when you read the code, that's ok.

## Library dependencies: 
* boost
* llvm
* SDL2

## Installing

```bash
git clone https://github.com/vorontsov-amd/Compiller.git
cd Compiller
git switch ir-interpreter
git submodule init && git submodule update
```

## Building
```bash
cmake -B build
cmake --build build
```

## Runing
```bash
./build/bin/ir-interpreters
```