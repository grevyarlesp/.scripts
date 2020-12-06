#!/bin/bash

var=$(setxkbmap -query | grep layout | xargs)
if [ "$var" = 'layout: us' ]; then
	setxkbmap de
else 
	setxkbmap us
fi

