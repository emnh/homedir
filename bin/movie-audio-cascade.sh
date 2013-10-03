#!/usr/bin/zsh
for i in `seq 1 15`; do
    s=$(python -c "print 165")
    mplayer -cache 2048 -ss $s -vo null "$1" &
done
#mplayer -cache 32768 -ss $s -ao null "$1"
