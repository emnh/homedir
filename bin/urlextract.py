#!/usr/bin/env python

# XXX: clean up.
# XXX: relative links to root are wrongly handled.
# XXX: use option parser.
# XXX: add template stuff

'extract urls from an html page'

import htmllib
import HTMLParser as xhtmllib
import os
import re
import sys
import urllib
from formatter import NullFormatter

def getSearchParser(badhtml, imgs):
    'get html parser'
    if badhtml:
        HTMLParser = htmllib.HTMLParser
    else:
        HTMLParser = xhtmllib.HTMLParser

    class SearchParser(HTMLParser):
        "Class for parsing a html page for links"

        def __init__(self):
            #super(SearchParser, self).__init__(self)
            if badhtml:
                HTMLParser.__init__(self, NullFormatter())
            else:
                HTMLParser.__init__(self)
            self.urls = []

        def handle_starttag(self, *args):
            if badhtml:
                HTMLParser.handle_starttag(self, *args)
                tag, method, attrs = args
            else:
                tag, attrs = args

            dattrs = dict(attrs)
            if tag == 'a': 
                if 'href' in dattrs:
                    url = dattrs['href']
                    self.urls.append(url)
            elif imgs and tag == 'img':
                if 'src' in dattrs:
                    url = dattrs['src']
                    self.urls.append(url)
                

    return SearchParser

def usage():
    print "usage: %s url [baseurl]" % sys.argv[0]
    print 'baseurl - the url to prefix relative links with'

def main():
    'entry point'
    if len(sys.argv) < 2:
        usage()
        sys.exit(1)

    if '--img' in sys.argv:
        imgs = True
        sys.argv.remove('--img')
    else:
        imgs = False

    if '--not-xhtml' in sys.argv:
        # invalid xhtml
        sys.argv.remove('--not-xhtml')
        badhtml = True
    else:
        # valid XHTML
        badhtml = False

    url = sys.argv[1]
    if '://' in url:
        baseurl = url
    else:
        baseurl = ''

    if len(sys.argv) >= 3:
        baseurl = sys.argv[2]

    searchres = urllib.urlopen(url)
    htmldata = searchres.read()
    searchres.close()

    SearchParser = getSearchParser(badhtml, imgs)
    parser = SearchParser()
    parser.feed(htmldata)
    for url in parser.urls:
        if url.startswith('/') or not url.startswith('http'):
            url = baseurl + url
        print url

if __name__ == '__main__':
    main()
