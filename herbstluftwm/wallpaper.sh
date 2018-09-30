#!/bin/bash
#Get all different wallpapers
files=(~/.config/herbstluftwm/wallpapers/*)
wallpaper="${files[RANDOM % ${#files[@]}]}"
feh --bg-scale $wallpaper
