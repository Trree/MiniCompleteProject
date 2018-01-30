# Minimum Complete Project

A minimum complete project, support docker, ci, unittest, clang-format, clang-tidy.

[![Build Status](https://travis-ci.org/Trree/MiniCompleteProject.svg?branch=master)](https://travis-ci.org/Trree/MiniCompleteProject)

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

<!-- /TOC -->

## About

This project support multiple compliers and multiple platform, and support clang-format and clang-tidy in the cmake, last, it support ci.

## Start

> python3 build.py --help

### Build Local 

> python3 build.py 

### Build from docker 

> python build.py --docker-name {dockername}

If you want to use docker, you have to build docker image firstly.
In the docker directory, we provide two dockerfile,  it is ubuntu-trusty and alpine respectively.
> cd docker/{linux-platform}/
> sudo docker build -t {mini-complete-linux-platform} .

you also can build  and run it like this:
> sudo docker run -it -v "$PWD":"$PWD" -w "$PWD" {mini-complete-linux-platform} ./build.py --docker-name {mini-complete-linux-platform}
> sudo docker run -it --rm --privileged  -v "$PWD":"$PWD" -w "$PWD" {mini-complete-linux-platform}  stage/{mini-complete-linux-platform}/release/main 

## Build Env (docker)

If you work on the windows or mac, and you want to cross platform , you don't want to use virtual machine, because it is so heavy. Docker is better choose.

- If you need boost or others library, you don't need to build environment again and again. And others don't need to build it again.
- You can build multiple platform by dockrfile.
- You only need one source code. you can run it use 'docker -v'.

## Compilers

- GCC
- Clang
- MSVC

**GCC / Clang warning**

```

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
-Wlogical-op 
-Wuseless-cast
-Wdouble-promotion
-Wformat=2
-Weffc++
-pedantic
```

## Build Tool(Cmake)

Support cross-platform, you can easy use it for linux, android, window.

### Static Analyzers and Indent

You can integrate clang-tidy and clang-format easily in a CMake-based build-system.

[clang-cxx-dev-tools.cmake](cmake/clang-cxx-dev-tools.cmake)

## unittest

This project use doctest, it just give a simple example. You should choose to better unit test tool base on your need.

## CI (travis ci)

[Travis CI](http://travis-ci.org/)

This project provode a exmple [.travis.yml](.travis.yml). It support gcc/clang.
You have to pass clang-tidy, build , unittest, test. It so sucess.
It can avoid Primary mistake.
