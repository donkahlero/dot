#!/bin/bash
#Get all different wallpapers
files=(~/Pictures/wallpaper/*)
wallpaper="${files[RANDOM % ${#files[@]}]}"
feh --bg-fill $wallpaper
