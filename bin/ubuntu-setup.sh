#!/bin/bash

# Setup settings
JAVA8=false
IDEA=false
CDEV=false

cd ~

# Set up home dir git repo
if [ ! -x ~/.bash_zsh_rc ]; then
  git clone https://github.com/emnh/homedir homedir
  for file in `ls -1A homedir`; do
    mv homedir/$file ~/
  done
  git submodule update --init
fi

# Essential packages
sudo aptitude install chromium-browser vim zsh exuberant-ctags geeqie

if $CDEV; then
  sudo aptitude install build-essential
fi

# Change shell to zsh
[ -x /usr/bin/zsh ] && 
! grep -q "$USER.*zsh$" /etc/passwd &&
echo "Changing shell to zsh" &&
chsh -s /usr/bin/zsh

# Java 8
if $JAVA8; then
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install oracle-java8-installer
fi

# IntelliJ IDEA
if $IDEA; then
  # chromium-browser http://www.jetbrains.com/idea/download/
  wget -c http://download-cf.jetbrains.com/idea/ideaIC-13.1.3.tar.gz
fi
