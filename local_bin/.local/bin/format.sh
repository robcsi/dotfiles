#!/bin/sh

echo "Wanting to format usb drive to Fat32. Everything will be deleted from it..."
sudo gpart show da0

#deleting and destroying partition
sudo gpart delete -i 1 da0

sudo gpart destroy da0


#creating partition
sudo gpart create -s gpt da0

sudo gpart add -t mbr da0

sudo newfs_msdos -F32 /dev/da0p1
