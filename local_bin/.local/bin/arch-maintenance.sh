#!/bin/bash
# Arch maintenance. Run unattended from topgrade ([commands] in ~/.config/topgrade.toml),
# which replaces topgrade's built-in "system" step.
set -o pipefail

echo "Check systemd failed services:"
systemctl --failed
echo

echo "Check journal errors this boot:"
sudo journalctl -p 3 -xb --no-pager | tail -20
echo

# Keyring first, as a full upgrade -- a bare `-Sy` desyncs the package DB from
# what is installed and is the classic partial-upgrade footgun.
echo "Update arch keyring:"
sudo pacman -Syu --noconfirm archlinux-keyring
echo

echo "Update packages (repo + AUR):"
yay -Syu --noconfirm
echo

# NOTE: `yay -Ycc` deliberately removed. On 2026-09-10 it ran
# `pacman -R -s -u` and took out instantshell, instantdotfiles, imosid,
# papirus-icon-theme, ranger, xfce4-power-manager and more. Its idea of
# "unneeded" includes explicitly wanted packages. Run it by hand, never
# unattended, and read the list before confirming.

echo "Orphans:"
orphans=$(pacman -Qtdq 2>/dev/null)
if [ -n "$orphans" ]; then
    echo "$orphans"
    echo "Removing orphans:"
    # shellcheck disable=SC2086
    sudo pacman -Rns --noconfirm $orphans
else
    echo "none"
fi
echo

echo "Trim package cache:"
yay -Sc --noconfirm
echo

# Clean the journal:
# sudo journalctl --vacuum-time=2weeks

# Mirrorlist:
# sudo reflector -c Romania,Hungary,Germany -a 12 --sort rate --save /etc/pacman.d/mirrorlist
