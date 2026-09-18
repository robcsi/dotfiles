# instantOS autostart script
# This script gets executed when robcsi logs in
# Add & (a literal) ampersand to the end of a line to make it run in the background

# Remove stray ~/.fehbg so it can't override the nitrogen wallpaper on boot (instantOS uses nitrogen, not feh)
rm -f "$HOME/.fehbg"

xfce4-power-manager &
nm-applet &
pa-applet &
blueman-applet &
# solaar &
picom -b &
