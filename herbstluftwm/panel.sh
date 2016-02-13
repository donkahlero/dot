#!/bin/bash
[[ $0 == /* ]] && script="$0" || script="${PWD}/${0#./}"
panelfolder=${script%/*}
trap 'herbstclient emit_hook quit_panel' TERM
herbstclient pad 0 32
herbstclient emit_hook quit_panel

"$panelfolder/tags.sh" &
pids+=($!)

sleep 1

conky -c "$panelfolder/conkyrc" &
pids+=($!)

herbstclient --wait '^(quit_panel|reload).*'
kill -TERM "${pids[@]}" >/dev/null 2>&1

sleep 1
nm-applet    2>&1 /dev/null &
stalonetray  2>&1 /dev/null
killall nm-applet
exit 0
