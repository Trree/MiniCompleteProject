# Minimum Complete Project

A minimum complete project, support docker, ci, unittest, clang-format, clang-tidy, valgrind.

The goal of this project is to provide a platform for developing and automating real-world scenarios.

[![Build Status](https://travis-ci.org/Trree/MiniCompleteProject.svg?branch=master)](https://travis-ci.org/Trree/MiniCompleteProject)
[![Build status](https://ci.appveyor.com/api/projects/status/o5o914eppl7boy2k/branch/master?svg=true)](https://ci.appveyor.com/project/Trree/minicompleteproject/branch/master)

[中文说明](doc/description.md)

<!-- TOC -->

- [Minimum Complete Project](#minimum-complete-project)
    - [About](#about)
    - [Start](#start)
        - [Build Local](#build-local)
        - [Build from docker](#build-from-docker)
    - [Build Env (docker)](#build-env-docker)
    - [Compilers](#compilers)
    - [Build Tool(Cmake)](#build-toolcmake)
        - [Static Analyzers and Indent](#static-analyzers-and-indent)
    - [unittest](#unittest)
    - [CI (travis ci)](#ci-travis-ci)
    - [How to start your projcet](#how-to-start-your-project)

<!-- /TOC -->

## About

This project support multiple compliers and multiple platform, and support clang-format and clang-tidy in the cmake, last, it support ci.

## Start

> python3 build.py --help

### Build Local 

> python3 build.py 

### Build from docker 

> python build.py --docker-name {dockername}

File will be generated in stage directory.

If you want to use docker, you have to build docker image firstly.

In the docker directory, we provide two dockerfile,  it is ubuntu-trusty and alpine respectively.

```
cd docker/{linux-platform}
sudo docker build -t {mini-complete-linux-platform} .
```

you also can build  and run it like this:

```
python3 build.py --docker-name {mini-complete-linux-platform}
sudo docker run -it --rm -v "$PWD":"$PWD" -w "$PWD" {mini-complete-linux-platform}  stage/{mini-complete-linux-platform}/release/main 
```

## Build Env (docker)

If you work on the windows or mac, and you want to cross platform , you don't want to use virtual machine, because it is so heavy. Docker is better choose.

- If you need boost or others library, you don't need to build environment again and again. And others don't need to build it again.
- You can build multiple platform by dockrfile.
- You only need one source code. you can run it use 'docker -v'.

## Compilers

- GCC
- Clang
- MSVC

## Build Tool(Cmake)

Support cross-platform, you can easy use it for linux, android, window.
More importantly, it supports clang-format, clang-tidy, valgrind and ctest.

```
make clang-format
make clang-tidy
make valgrind 
ctest --output-on-failure
```

### Static Analyzers and Indent

You can integrate clang-tidy and clang-format easily in a CMake-based build-system.

[clang-cxx-dev-tools.cmake](cmake/clang-cxx-dev-tools.cmake)

## Memory Check

If you install valgrind , you can use "make valgrind" test memory leak.

## Ctest 

Cmake support ctest, you can add\_test in the CMakeList.txt.

## unittest

This project use [doctest](https://github.com/onqtam/doctest), it just give a simple example. 

You should choose to better unit test tool base on your need.

## CI (travis ci)

[Travis CI](https://travis-ci.org/)
This project provode a exmple [.travis.yml](.travis.yml). 

[appveyor](https://ci.appveyor.com)
This project provode a exmple [appveyor.yml](appveyor.yml). 

It supports gcc/clang and MSVC. You have to pass all the tests(clang-tidy, build, unittest, test) to be successful.


## How to start your projcet

You can test this project first. Then fork this project, replacing your file with the main.cpp file. Appropriately modify the CMakeList.txt file on it.
