#! /usr/bin/bash

rofi -show emoji -modi emoji -location 1 -width 100 \
	 -lines 5 -line-margin 0 -line-padding 1 \
	 -separator-style none -font "mono 13" -columns 5 -bw 0 \
	 -disable-history \
	 -hide-scrollbar \
	 -display-drun "Apps" \
	 -color-window "#2E3440, #2E3440, #b1b4b3" \
	 -color-normal "#2E3440, #b1b4b3, #2E3440, #005577, #b1b4b3" \
	 -color-active "#222222, #b1b4b3, #222222, #007763, #b1b4b3" \
	 -color-urgent "#222222, #b1b4b3, #222222, #77003d, #b1b4b3" \
	 -show-icons \
	 -kb-row-select "Tab" -kb-row-tab ""

