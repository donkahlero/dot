#!/bin/bash
mute=`pamixer --get-mute`
if [ $mute == "false" ]
then
    vol=`pamixer --get-volume`
    vol="$vol%"
    echo $vol
else
    echo "Mute"
fi
