#!/bin/bash
#Get all different wallpapers
files=(wallpapers/*)
wallpaper="${files[RANDOM % ${#files[@]}]}"
feh --bg-scale $wallpaper
