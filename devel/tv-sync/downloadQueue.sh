#!/bin/bash
function download {
    file="$1"
    while ! rsync --bwlimit 500 -avP --append "$file" . ; do
	    sleep 5m
    done
}
while read file; do
    download "$file"
done
