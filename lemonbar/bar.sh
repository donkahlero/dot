#!/usr/bin/env bash

# Config
foreground="#1AA"
background="#333"
viewed_fg="#333"
viewed_bg="#1AA"
urgent_fg=
urgent_bg="#F99"
used_fg="#AA1"
used_bg="#333"

# Read in all the tags from herbstluft
while true; do
    # Left-aligned output
    tags=( $(herbstclient tag_status) )
    for tag in "${tags[@]}" ; do
        case ${tag:0:1} in
            '#') cstart="%{F$viewed_fg}%{B$viewed_bg}" ;;
            '+') cstart="%{F$viewed_fg}%{B$viewed_bg}" ;;
            ':') cstart="%{F$used_fg}%{B$used_bg}"     ;;
            '!') cstart="%{F$urgent_fg}%{B$urgent_bg}" ;;
            *)   cstart=''                             ;;
        esac
        echo -n "${cstart} ${tag:1} "
        echo -n "%{F$foreground}%{B$background}"
    done

    # Right-aligned output
    echo -n "%{r}"
    echo -n "$(date +'%H:%M %p')"
    echo -n " "

    # Wrap-up
    echo
    sleep 0.1
done
