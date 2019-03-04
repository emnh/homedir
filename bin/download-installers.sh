#!/bin/bash
# deprecated. use chocolatey package manager for windows
mkdir -p /mnt/c/Users/emh/Downloads/installers
cd /mnt/c/Users/emh/Downloads/installers
wget -c https://atom.io/download/windows_x64 -O atom.exe
wget -c https://www.7-zip.org/a/7z1806-x64.exe -O 7zip.exe
wget -c http://download-hr.utorrent.com/track/stable/endpoint/utorrent/os/windows -O utorrent.exe
wget -c https://ftp.nluug.nl/pub/vim/pc/gvim81.exe -O gvim.exe
wget -c https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.70-installer.msi -O putty.msi
wget -c https://winscp.net/download/WinSCP-5.13.7-Setup.exe -O winscp.exe
explorer.exe 'C:\Users\emh\Downloads\installers'
