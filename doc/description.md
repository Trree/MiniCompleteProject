# 最小完备的项目

本项目的目标是提供一个集开发，跨平台，自动测试的平台。

使用docker可以跨平台开发。CMake可以跨平台编译，并且在自动CI的时候自动在linux/Unix/Windows和GUN/CLANG/MSVS中进行编译，单元测试和集成测试。

<!-- TOC -->

- [最小完备的项目](#%E6%9C%80%E5%B0%8F%E5%AE%8C%E5%A4%87%E7%9A%84%E9%A1%B9%E7%9B%AE)
    - [Start](#start)
    - [开发环境(docker)](#%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83docker)
    - [跨平台开发(CMake)](#%E8%B7%A8%E5%B9%B3%E5%8F%B0%E5%BC%80%E5%8F%91cmake)
    - [代码格式化](#%E4%BB%A3%E7%A0%81%E6%A0%BC%E5%BC%8F%E5%8C%96)
    - [静态代码检查](#%E9%9D%99%E6%80%81%E4%BB%A3%E7%A0%81%E6%A3%80%E6%9F%A5)
    - [内存检测](#%E5%86%85%E5%AD%98%E6%A3%80%E6%B5%8B)
    - [MR的开发流程](#mr%E7%9A%84%E5%BC%80%E5%8F%91%E6%B5%81%E7%A8%8B)
    - [基准测试](#%E5%9F%BA%E5%87%86%E6%B5%8B%E8%AF%95)
    - [单元测试](#%E5%8D%95%E5%85%83%E6%B5%8B%E8%AF%95)
    - [冒烟测试](#%E5%86%92%E7%83%9F%E6%B5%8B%E8%AF%95)
    - [CI的集成](#ci%E7%9A%84%E9%9B%86%E6%88%90)
    - [如何开始你自己的项目](#%E5%A6%82%E4%BD%95%E5%BC%80%E5%A7%8B%E4%BD%A0%E8%87%AA%E5%B7%B1%E7%9A%84%E9%A1%B9%E7%9B%AE)

<!-- /TOC -->

## Start

本项目提供了两种编译方式

**Linux本地**

如果是使用本地的开发环境
```
mkdir build
cd build
cmake ..
make
ctest --output-on-failure

make clang-format
make clang-tidy
make valgrind
```

**docker**

如果是使用docker开发，需要先到 docker 目录中的dockerfile处，编译出docker镜像。
>sudo docker build -t {mini-complete-linux-platform} .

然后回到主目录中用build.py编译docker镜像下的文件

> python3 build.py --docker-name {mini-complete-linux-platform}

编译后会在 stage 目录下根据相应的平台和类型生成测试结果，测试:

> sudo docker run -it --rm -v "$PWD":"$PWD" -w "$PWD" {mini-complete-linux-platform}  stage/{mini-complete-linux-platform}/release/main

## 开发环境(docker)

开发环境我们是用docker的镜像完成的。
为什么需要使用docker去搭建开发环境，docker本身的优势我们是知道的。

- 本项目主要是使用C++去做开发的，所以基本的GCC的开发编译环境是需要的，项目依赖boost，编译依赖CMake和Python。这里最主要的就是boost的编译开发环境，编译这个库需要的工作量对于一个新的开发者是不
低的。所以我们使用了一个统一的镜像环境。
- 本项目需要支持多个Linux系统，在多个系统中编译这些开发环境也是需要环境的，我们是最开始提供一个dockerfile，然后使用这个dockerfile制作多个linux版本的开发环境
- 跨平台开发，因为提供了开发环境，所以我们可以直接在mac或者任意的环境开发，而且这些都是轻量级的，没有虚拟机那么重
- 文件的统一，虽然我们已经使用了git做代码的管理，但是因为是使用docker编译的，所以我们只需要在编译的时候指定volume，这样就可以不同在不同的开发环境中都保存同一份代码了。

## 跨平台开发(CMake)

在跨平台开发中我们主要支持Linux平台，Android平台，Windows平台，本项目希望能够使用一条命令就可以将编译出当前平台的代码。

CMake是当前最流行的跨平台构建技术
除了跨平台的优势外，使用现代CMake（CMake 3.0以上）能很大程度上模块化管理，并且支持ctest。

在cmake目录中提供了三个Cmake模块

- clang-cxx-dev-tools.cmake 支持clang-format和clang-tidy
- common.cmake 提供了跨平台的编译器选项，并且提供了比较全面的警告选项
- memory-check.cmake 支持内存检测

## 代码格式化

**集成到Cmake中**

代码格式化使用的是 clang-format，提供一个统一的代码格式。

在项目中增加定制的 .clang-format 文件，然后增加一个python的格式化脚本，


## 静态代码检查

**集成到Cmake中**

在C++的代码中，提供静态代码检测是需要的，这样更好的防止错误的发生。
本项目中使用的是clang-tidy，并且cmake中支持集成这个工具。

## 内存检测

**集成到Cmake中**

如果你的平台中安装了valgrind，可以提供内存检测。

## MR的开发流程

在搭建完基本的项目框架之后，本项目的开发流程是基本MR的开发方式。

不使用分支的原因是分支不能提供清晰的注释的地方。并且在issue提供完整的需要，在MR处提供完整的技术方案，在后期的代码查找提供了方向。
```
issue(需求)->MR(技术方案)->coding->code review->merge

```
## 基准测试

这个提供了最简功能的代码，代码核心的最简版，不提供多余的功能。

这样提供了测试的基准，新增代码对项目的性能的影响。

## 单元测试

本项目使用的是doctest，当然在不同的项目中使用单元测试是权衡的结果。

## 冒烟测试

这个主要提供了最简单的集成测试。核心代码的功能测试。

## CI的集成

- [Travis CI](https://travis-ci.org) (Linux全平台测试和GUN/clang测试)
- [appveyor](https://ci.appveyor.com）(VS2012-2017全版本测试)

因为是在github平台，所以项目使用了Travis CI 和 appveyor。提供了一个.travis.yml 和 appveyor.yml的示例。

在这个项目中CI集成的优势是提供了代码合并的要求。
在CI中我们集成了编译，单元测试，冒烟测试。
在每一次的代码提交的时候都会做一次测试，必须通过所有的测试才可以代码合并。
这样防止了主分支出现初级的错误。

## 如何开始你自己的项目

Fork这个项目到自己的仓库中，然后在[Travis-CI](https://travis-ci.org/)和[appveyor](https://ci.appveyor.com)中开启自动测试的功能。

用你自己的程序替代main.cpp，提交代码后可以跨平台自动集成测试。
