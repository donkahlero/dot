#!/bin/bash
[[ $0 == /* ]] && script="$0" || script="${PWD}/${0#./}"
panelfolder=${script%/*}
trap 'herbstclient emit_hook quit_panel' TERM
herbstclient pad 0 32
herbstclient emit_hook quit_panel

"$panelfolder/tags.sh" &
pids+=($!)

sleep 1

# If you want to use the confy script
conky -c "$panelfolder/conkyrc" &

pids+=($!)

herbstclient --wait '^(quit_panel|reload).*'
kill -TERM "${pids[@]}" >/dev/null 2>&1

exit 0
