#!/bin/bash

echo "fixing teams blurred screen sharing problem..."
sudo mv -f /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/rect-overlay /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/rect-overlay.orig

echo
echo done...
echo "restart teams!!!"
