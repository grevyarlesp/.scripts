#!/usr/bin/env bash

menu_list="Sysmenu\nWeb\nCapture\nManpages\nTodo-List\n"
sel=$(echo -e "$menu_list" | dmenu $@ -i -h 30 -sb "#4d97ff" -nb "#000000" -sb "#4d97ff" -sf "#19262b" -o 0.9 -y 35 -w 900 -x 235 -p Robin::Choose_a_option:: -fn terminus-12)

case "$sel" in
    Sysmenu)  quit & ;;
    Web) browse & ;;
    Capture) capture & ;;
    Manpages) manp & ;;
    Todo-List) dmenu_todo.sh & ;;
esac
