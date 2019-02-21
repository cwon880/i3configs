#!/bin/bash

screenname=$(xrandr | grep " connected" | cut -f1 -d" ")
if [[ $screenname == *"HDMI-1"* ]]
then
    screenname=HDMI-1
    brightness=$(xrandr --verbose | grep -i brightness | cut -f2- -d:)
    brightness=$(echo $brightness | awk '{print $2}')
else
    brightness=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2- -d:)
    echo $brightness
fi
echo $screenname
if [ "$1" = "+" ]
then
    brightness=$(echo "$brightness + 0.1" | bc)
    echo $brightness
    xrandr --output $screenname --brightness $brightness;
elif [ "$1" = "-" ]
then
    brightness=$(echo "$brightness - 0.1" | bc)
    echo $brightness
    xrandr --output $screenname --brightness $brightness;
fi
