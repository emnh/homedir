#!/bin/bash
mkdir -p /home/emh/data &&
sudo mount -o uid=emh,gid=emh /dev/nvme0n1p6 /home/emh/data &&
sudo modprobe nbd &&
sudo qemu-nbd --connect=/dev/nbd0 emh.vhdx &&
mkdir -p /home/emh/data/emh &&
sudo mount /dev/nbd0p2 /home/emh/data/emh
