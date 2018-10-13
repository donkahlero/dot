#!/usr/bin/env bash

# Config
foreground="#f0f0f0"
background="#1d1e20"
viewed_fg="#1d1e20"
viewed_bg="#f0f0f0"
urgent_fg="#fb055a"
urgent_bg="#1d1e20"
used_fg="#26ffd4"
used_bg="#1d1e20"
hl_fg="#fc59a6"
hl_bg="#1d1e20"
music_fg="#55adff"
music_bg="#1d1e20"

function hl() {
    output+="%{B$hl_bg}%{F$hl_fg}"
    output+="$1"
    output+="%{B$background}%{F$foreground}"
}

function write() {
    output+=" $1"
}

function delim() {
    output+="  |  "
}

# Read in all the tags from herbstluft
while true; do
    # Left-aligned output
    output="%{l}"

    # Music
    player_status="$(playerctl status)"
    if [ "$player_status" = "Playing" ] || [ "$player_status" = "Paused" ]
    then
        write "%{A:playerctl play:}"
        if [ "$player_status" = "Playing" ]
        then
            output+="%{F$music_fg}%{B$music_bg}\\ue0b0%{F$foreground}%{B$background}"
        else
            output+="\\ue0b0"
        fi
        output+="%{A}"

        output+=" %{A:playerctl pause:}"
        if [ "$player_status" = "Paused" ]
        then
            output+="%{F$music_fg}%{B$music_bg}\\ue0ac%{F$foreground}%{B$background}"
        else
            output+="\\ue0ac"
        fi
        output+="%{A}"

        output+=" %{A:playerctl previous:}\\ue0b4%{A}"
        output+=" %{A:playerctl next:}\\ue0aa%{A}"

        output+=" $(playerctl metadata artist) - $(playerctl metadata title)"
    fi

    # Center-aligned output
    output+="%{c}"

    # HWM Tag
    tags=( $(herbstclient tag_status) )
    for tag in "${tags[@]}" ; do
        case ${tag:0:1} in
            '#') cstart="%{F$viewed_fg}%{B$viewed_bg}" ;;
            '+') cstart="%{F$viewed_fg}%{B$viewed_bg}" ;;
            ':') cstart="%{F$used_fg}%{B$used_bg}"     ;;
            '!') cstart="%{F$urgent_fg}%{B$urgent_bg}" ;;
            *)   cstart=''                             ;;
        esac
        output+="${cstart}%{A:herbstclient use ${tag:1}:} ${tag:1} %{A}"
        output+="%{F$foreground}%{B$background}"
    done

    # Right-aligned output
    output+="%{r}"

    # Wireless Network
    hl "\\ue146"

    essid="$(iwgetid -r)"
    if [ -n "$essid" ]
    then
        write "$essid"
    else
        write "NOT CONNECTED"
    fi

    delim

    # Battery
    bat_full="$(cat /sys/class/power_supply/BAT0/charge_full)"
    bat_curr="$(cat  /sys/class/power_supply/BAT0/charge_now)"
    bat_perc="$(echo "$bat_curr / $bat_full  * 100" | bc -l | cut -f1 -d".")"
    bat_status="$(cat /sys/class/power_supply/BAT0/status)"

    if [ "$bat_status" = "Full" ] || [ "$bat_perc" -gt 99 ]
    then
        hl "\\ue0cd"
        write "FULL"
    elif [ "$bat_status" = "Charging" ]
    then
        hl "\\ue02a"
        write "$bat_perc%"
    elif [ "$bat_status" = "Discharging" ]
    then
        if [ "$bat_perc" -gt 75 ]
        then
            hl "\\ue02b"
        elif [ "$bat_perc" -gt 50 ]
        then
            hl "\\ue02c"
        elif [ "$bat_perc" -gt 15 ]
        then
            hl "\\ue02e"
        else
            hl "\\ue02d"
         fi

        write "$bat_perc%"
    fi

    delim

    # Volume
    if [ "$(pamixer --get-mute)" = "false" ]
    then
        volume="$(pamixer --get-volume)"

        if [ "$volume" -gt 66 ]
        then
            hl "\\ue134"
        elif [ "$volume" -gt 33 ]
        then
            hl "\\ue132"
        else
            hl "\\ue135"
        fi

        write "$volume%"

    else
        hl "\\ue133"
        write "Muted"
    fi

    delim

    # Time
    hl "\\ue120"
    write "$(date +'%I:%M %p')"

    # Wrap-up
    echo -e "$output "
    sleep 0.05
done

