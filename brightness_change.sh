#!/bin/bash
# changeVolume

# Arbitrary but unique message id
msgId="991044"

# kill -"$(pgrep volumechange.sh)"
# Change the volume using alsa(might differ if you use pulseaudio)
case $1 in
    +) 
        xbacklight -inc 4
        ;;
    -)
        xbacklight -dec 4
        ;;
esac

# pactl -- set-sink-volume 0 "$@"
# Query amixer for the current volume and whether or not the speaker is muted
# volume="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
brightness="$(xbacklight -get)"
brightness=${brightness%.*}
# Show the volume notification
bar=$(seq --separator="─" 0 "$((brightness / 4))" | sed 's/[0-9]//g')
dunstify -a "changeBrightness" -u low -i audio-volume-high -r "$msgId" \
"Brightness: ${brightness}%" "$bar"

# Play the volume changed sound

# canberra-gtk-play -i audio-volume-change -d "changeVolume"
