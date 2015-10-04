#!/bin/bash
# https://gist.github.com/caniszczyk/3856584
curl -s 'https://api.github.com/users/emnh/repos?per_page=200' |
ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["clone_url"]} ]}'
