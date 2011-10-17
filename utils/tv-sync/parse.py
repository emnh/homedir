#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ft=python ts=4 sw=4 sts=4 et fenc=utf-8
# Original author: "Eivind Magnus Hvidevold" <hvidevold@gmail.com>
# License: GNU GPLv3 at http://www.gnu.org/licenses/gpl.html

'''
'''

import os
import sys
import re
import itertools
from collections import defaultdict
from pprint import pprint

DEBUG = False

class Config:
    seen_eps_file = 'seen.txt'
    new_eps_file = 'newseries.txt'
    want_series = []
    files_only = False

def parseWant(s):
    'e.g.: nikita s02e01,dexter s03e05'
    return [part + '.mkv' for part in s.split(',')]

class ConfigUtil:
    transform = {
        'want_series': parseWant
    }

    @staticmethod
    def parseArgs(args):
        c = Config()
        for arg in args:
            if '=' in arg:
                k, v = arg.split('=', 2)
                if k in ConfigUtil.transform:
                    v = ConfigUtil.transform[k](v)
                setattr(c, k, v)
        return c

def unique_everseen(iterable, key=None):
    "List unique elements, preserving order. Remember all elements ever seen."
    # unique_everseen('AAAABBBCCDAABBB') --> A B C D
    # unique_everseen('ABBCcAD', str.lower) --> A B C D
    seen = set()
    seen_add = seen.add
    if key is None:
        for element in ifilterfalse(seen.__contains__, iterable):
            seen_add(element)
            yield element
    else:
        for element in iterable:
            k = key(element)
            if k not in seen:
                seen_add(k)
                yield element

def normalize(name):
    name = re.sub('\.', ' ', name)
    name = re.sub(' +', ' ', name)
    name = name.strip()
    name = name.title()
    return name

def parseFileName(filePath):
    fileName = os.path.basename(filePath)
    ep_re = '^(?P<name>.*)s(?P<season>[0-9]{2})e(?P<episode>[0-9]{2}).*.mkv$'
    match = re.search(ep_re, fileName, re.I)
    if match:
        d = match.groupdict()
        d['name'] = normalize(d['name'])
        d['season'] = int(d['season'])
        d['episode'] = int(d['episode'])
        d['filepath'] = filePath
        return d

def usage():
    'print usage'
    print 'usage: %s [options]' % sys.argv[0]

def parseFileList(files):
    eps = [(fileName, parseFileName(fileName)) for fileName in files]
    if DEBUG:
        unmatched = [f for f, ep in eps if ep == None]
        print('Unmatched:')
        for f in unmatched:
            print f
    eps = [ep for f, ep in eps if ep != None]
    eps_by_name = defaultdict(list)
    for ep in eps:
        eps_by_name[ep['name']].append(ep)
    return eps_by_name

def epSortKey(ep):
    return (ep['season'], ep['episode'])

def summarize_ep_list(eps):
    'range compression: s01,s02,s03,s05 -> s01-s03,s05'
    fkey = epSortKey
    eps = list(unique_everseen(eps, fkey))
    eps.sort(key=fkey)
    range_list = []
    ranges = [[eps[0]]]
    for i in range(1, len(eps)):
        ep = eps[i]
        oldep = ranges[-1][-1]
        if oldep['season'] == ep['season'] and oldep['episode'] + 1 == ep['episode']:
            ranges[-1].append(ep)
        else:
            ranges.append([ep])
    def formatRange(range_):
        if len(range_) > 1:
            ep, lastep = range_[0], range_[-1]
            ep = 'S%02dE%02d' % (ep['season'], ep['episode'])
            lastep = 'S%02dE%02d' % (lastep['season'], lastep['episode'])
            return ep + '-' + lastep
        else:
            ep = range_[0]
            return 'S%02dE%02d' % (ep['season'], ep['episode'])

    return [formatRange(range_) for range_ in ranges]

def print_eps_summary(eps_by_name):
    items = eps_by_name.items()
    items.sort()
    for name, eps in items:
        eplist = summarize_ep_list(eps)
        print repr(name), name, ','.join(eplist)

def main():
    'entry point'
    if len(sys.argv) < 1:
        usage()
        sys.exit(1)
    conf = ConfigUtil.parseArgs(sys.argv)
    eps = file(conf.seen_eps_file).readlines()
    eps += conf.want_series
    eps = [x.strip() for x in eps]
    eps_by_name = parseFileList(eps)

    new_eps = file(conf.new_eps_file).readlines()
    new_eps = [x.strip() for x in new_eps]
    new_eps_by_name = parseFileList(new_eps)

    # find episodes that I have seen at least one of,
    # and are newer then the latest one I have seen
    want_eps_by_name = defaultdict(list)
    for new_name, new_eps in new_eps_by_name.items():
        for new_ep in new_eps:
            wants_it = False
            if new_name in eps_by_name:
                seen_eps = eps_by_name[new_name]
                last_seen_ep = max(seen_eps, key=epSortKey)
                if epSortKey(new_ep) > epSortKey(last_seen_ep):
                    wants_it = True
            elif new_name in conf.want_series:
                wants_it = True
            if wants_it:
                want_eps_by_name[new_name].append(new_ep)

    if conf.files_only:
        for new_eps in want_eps_by_name.values():
            for ep in new_eps:
                print ep['filepath']
        return

    if DEBUG:
        print 'Seen episodes:'
        print_eps_summary(eps_by_name)
        print

        print 'New episodes:'
        print_eps_summary(new_eps_by_name)

    print 'Want episodes:'
    print_eps_summary(want_eps_by_name)

    print 'Want files:'
    for new_eps in want_eps_by_name.values():
        for ep in new_eps:
            print ep['filepath']

if __name__ == '__main__':
    main()

