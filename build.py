#!/usr/bin/env python3

import sys
import os
import platform
import shutil
import glob
from subprocess import check_call

import argparse

def build_linux_target(docker_name):
    if docker_name:
        build_cmd = 'sudo docker run -it -v "$PWD":"$PWD" -w "$PWD" {0} ./localbuild.py --build-name {0}'.format(docker_name)
    else:
        build_cmd = './localbuild.py'
    if check_call(build_cmd, shell=True) != 0:
        sys.exit(-1)
        

def main(args):
    build_linux_target(args.docker_name)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Mini Complete project build script')
    parser.add_argument('--docker-name', help="docker image name")
    args = parser.parse_args()
    main(args)

