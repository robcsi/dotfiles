#!/bin/bash

echo Check systemd failed services:
systemctl --failed
echo

echo Check Journal entries:
sudo journalctl -p 3 -xb
echo

echo Update packages:
yay -Syu
echo

echo Remove unwanted dependencies:
yay -Ycc
echo

echo Check for orphans:
pacman -Qtdq
echo

echo Remove Orphans:
sudo pacman -Rns $(pacman -Qtdq)
echo

# Check directory size:
# du -sh /directory

# Clean the journal:
# sudo journalctl vacuum-time=2weeks (in my case)

# Mirrorlist:
# sudo reflector -c YourCountry -a 8 --sort rate --save /etc/pacman.d/mirrorlist
