#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ft=python ts=4 sw=4 sts=4 et fenc=utf-8
# Original author: "Eivind Magnus Hvidevold" <hvidevold@gmail.com>
# License: GNU GPLv3 at http://www.gnu.org/licenses/gpl.html

'''
compute dircolors file
'''

import random
import os
import sys
import re
import magic
from collections import defaultdict

class Ext(object):
    'file extension'
    def __init__(self):
        self.count = 0
        self.ftypes = set()

def usage():
    'print usage'
    print 'usage: %s [options]' % sys.argv[0]

def main():
    'entry point'
    if len(sys.argv) < 1:
        usage()
        sys.exit(1)

    magic_cookie = magic.open(magic.MAGIC_NONE)
    magic_cookie.load()

    extensions = defaultdict(lambda: Ext())
    for line in sys.stdin.readlines():
        path = line.rstrip()
        ext = os.path.splitext(os.path.basename(path))[1]
        ext = ext.lower()
        if ext and re.match('[a-z0-9]*', ext):
#            if ((extensions[ext].count % 10 == 0) 
#                    and (extensions[ext].count < 50)):
#                ftype = magic_cookie.file(path)
#                extensions[ext].ftypes.add(ftype)
            extensions[ext].count += 1

    # print extensions sorted by count
    items = extensions.items()
    items.sort(key=lambda x: x[1].count, reverse=True)
#    for key, val in items:
#        print key, val.count, val.ftypes

    # 16 black
    # 17 too dark
    colors = range(18, 232)

    for key, val in items:
        if val.count > 30:
            print '%s 38;5;%d' % (key, random.choice(colors))

    formats = []
    for line in sys.stdin.readlines():
        if not line.startswith('.'):
            continue
        formats.append(line)


if __name__ == '__main__':
    main()

