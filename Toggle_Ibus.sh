#!/bin/bash

var=$(ibus engine)
if [ "$var" = 'xkb:us::eng' ]; then
	ibus engine Bamboo
else 
	ibus engine xkb:us::eng
fi

