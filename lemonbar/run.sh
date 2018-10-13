#!/usr/bin/env bash
~/.config/lemonbar/bar.sh | \
    lemonbar -n herbstluftwm \
    -g 1920x30+0+0\
    -o -8 -f "MiniMono:size=10"\
    -o -7 -f "Typicons::size=11" | \
    while read line; do eval "$line"; done &

