#!/bin/bash

#https://wiki.archlinux.org/index.php/Feh#Random_background_image

wallpaper_dir=~/wallpapers/

#while true; do
	#find wallpaper_dir -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
		#shuf -n1 -z | xargs -0 feh --bg-max
	#sleep 15m
#done


shopt -s nullglob
cd $wallpaper_dir

while true; do
	files=()
	for i in *.jpg *.png; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}

	((range)) && feh --bg-scale "${files[RANDOM % range]}"

	sleep 1h
done

