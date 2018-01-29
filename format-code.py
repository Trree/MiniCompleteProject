#!/usr/bin/env python3

import sys
import os
import glob
from subprocess import check_call

import argparse

def main(args):
    myproject_top_src_dir = os.getcwd()
    myproject_common_sources = os.path.join(myproject_top_src_dir, '*.[h|c]pp')

    sources = []
    sources = sources + glob.glob(myproject_common_sources)

    for source in sources:
        check_call([args.clang_format, '-i', source])

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='project format')
    parser.add_argument('--clang-format', default='clang-format',
                        help='set path of clang-format, default="clang-format"')
    args = parser.parse_args()
    main(args)

