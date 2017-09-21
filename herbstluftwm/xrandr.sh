#!/bin/bash
# brightness_control.sh

_help()
{
        echo 
        echo "Usage:"
        echo "$0 [No args]    Sets/resets brightness to default (1.0)."
        echo "$0 +            Increments brightness by 0.5."
        echo "$0 -            Decrements brightness by 0.5."
        echo "$0 Number       Sets brightness to N (useful range .7 - 1.2)."
}

BRIGHT=$(xrandr --verbose | grep rightness | awk '{ print $2 }')
DISP_NAME="eDP-1-1"
INCR=0.05
MIN=.10
MAX=1.0     

function increase {
	NEW_BRIGHTNESS=$(echo "scale=2; $BRIGHT + $INCR" | bc)
	if [ $NEW_BRIGHTNESS \> $MAX ]
	then
		echo "Trying to set setting brighter than 1. Permitted."
		BRIGHT=1.0
	else
		BRIGHT=$NEW_BRIGHTNESS
	fi
}

function decrease {
	NEW_BRIGHTNESS=$(echo "scale=2; $BRIGHT - $INCR" | bc)
	if [ $NEW_BRIGHTNESS \< $MIN ]
	then
		echo "Trying to set the settings darker than 0.1. Permitted."
		BRIGHT=0.1
	else
		BRIGHT=$NEW_BRIGHTNESS
	fi
} 

case $1 in
        +)increase;; 
        -)decrease;;
        *)_help && exit ;; 
esac

xrandr --output "$DISP_NAME" --brightness "$BRIGHT"   # See xrandr manpage.
echo "Current brightness = $BRIGHT"
exit
