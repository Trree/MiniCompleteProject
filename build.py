#!/usr/bin/env python3

import sys
import os
import platform
import shutil
import glob
from subprocess import check_call

sys.path.insert(1, os.path.abspath(os.path.join('third_party', 'argparse')))

import argparse

def build_linux_target(build_type, with_tests, clean_first):
    build_type = build_type.lower()
    build_dir = os.path.join('stage', 'linux', build_type)
    if build_type == 'profiling':
        generate_cmd = 'export CXXFLAGS=-fno-omit-frame-pointer; cmake -B"{0}" -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING={1} -H.'.format(
                build_dir, with_tests)
    elif build_type == 'coverage':
        generate_cmd = 'export CXXFLAGS=--coverage; cmake -B"{0}" -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING={1} -H.'.format(
                build_dir, with_tests)
    else:
        generate_cmd = 'cmake -B"{0}" -DCMAKE_BUILD_TYPE={1} -DBUILD_TESTING={2} -H.'.format(
                build_dir, build_type.title(), with_tests)
    print(generate_cmd)
    if check_call(generate_cmd, shell=True) != 0:
        sys.exit(-1)
    build_cmd = 'cmake --build "{0}"'.format(build_dir)
    if clean_first:
        build_cmd = build_cmd + ' --clean-first'
    print(build_cmd)
    if check_call(build_cmd, shell=True) != 0:
        sys.exit(-1)



def main(args):
    build_linux_target(args.build_type, args.with_tests, args.clean_first)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Mini Complete project build script')
    parser.add_argument('--docker', help="docker image name")
    parser.add_argument('--build-type', choices=['release', 'debug', 'profiling', 'coverage'], default='release')
    parser.add_argument('--with-tests', action='store_true', help='build test targets')
    parser.add_argument('--clean-first', action='store_true', help='build target `clean` first, then build')
    args = parser.parse_args()
    main(args)

