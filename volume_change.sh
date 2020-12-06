#!/bin/bash
# changeVolume

# Arbitrary but unique message id
msgId="991049"

# kill -"$(pgrep volumechange.sh)"
# Change the volume using alsa(might differ if you use pulseaudio)
amixer -q set Master "$@"
# pactl -- set-sink-volume 0 "$@"
# Query amixer for the current volume and whether or not the speaker is muted
volume="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
if [[ $volume == 0 || "$mute" == "off" ]]; then
    # Show the sound muted notification
    bar=$(seq --separator="─" 0 "$((volume / 4))" | sed 's/[0-9]//g')
    dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" \
    "Volume muted: ${volume}%" "$bar" -t 1000
else
    # Show the volume notification

    bar=$(seq --separator="─" 0 "$((volume / 4))" | sed 's/[0-9]//g')
    dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" \
    "Volume: ${volume}%" "$bar" -t 1000
fi

# Play the volume changed sound

# canberra-gtk-play -i audio-volume-change -d "changeVolume"
