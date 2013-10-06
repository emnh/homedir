#!/bin/bash
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# KDE AutoStart
ln -sf ~/.dropbox-dist/dropboxd .kde/Autostart
