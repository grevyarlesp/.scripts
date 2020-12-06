#! /usr/bin/bash

rofi -show drun -modi drun -location 1 -width 100 \
	 -lines 5 -line-margin 0 -line-padding 1 \
	 -separator-style none -font "mono 13" -columns 5 -bw 0 \
	 -disable-history \
	 -hide-scrollbar \
	 -display-drun "Apps" \
	 -show-icons \
	 -kb-row-select "Tab" -kb-row-tab ""
