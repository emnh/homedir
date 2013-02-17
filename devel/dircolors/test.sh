#!/bin/bash
eval `dircolors -b tuned_dircolors`
ls --color -alU testdir/*.{mp3,ogg,wav,flac,mpc}
echo
ls --color -alU testdir/*.{mid,mod,xm,sid,nsf}
echo
ls --color -alU testdir/*.{mkv,avi,flv,mpg,mp4,mov}
echo
ls --color -alU testdir/*.{png,jpg,gif,bmp,svg}
echo
ls --color -alU testdir/*.{gz,bz2,lzma,zip,7z,rar,tar,rpm,deb}
