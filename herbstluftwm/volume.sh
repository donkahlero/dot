#!/bin/bash

# Pulse
MUTE=$(pactl list sinks | grep Mute | sed -e 's/^[ \t]*//')
UNMUTED="Mute: no"
if [ "$MUTE" == "Mute: no" ]
then
    VOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
    VOLUME="$VOLUME%"
    echo $VOLUME
else
    echo "Mute"
fi
