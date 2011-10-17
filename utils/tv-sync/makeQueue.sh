#!/bin/bash
seenSeries=$1
tvServer=$2
tvRoot=$3
find $seenSeries -iname '*.mkv' > seen.txt
ssh $tvServer "find $tvRoot -iname "*.mkv" -maxdepth 2" > newseries.txt
./parse.py files_only=true | sed s/^/$tvServer:/
