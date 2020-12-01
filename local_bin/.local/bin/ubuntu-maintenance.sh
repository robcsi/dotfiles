#!/bin/bash

echo Check systemd failed services:
systemctl --failed
echo

echo Check Journal entries:
sudo journalctl -p 3 -xb
echo

echo Update packages:
sudo apt update && sudo apt upgrade
echo

echo Remove unused packages:
sudo apt autoremove
echo

# Clean the journal:
# sudo journalctl vacuum-time=2weeks (in my case)

