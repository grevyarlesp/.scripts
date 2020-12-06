# !/usr/bin/env bash

# TODO: | sort -s -k 1,1

file=~/.todo
height=$(cat $file | wc -l)
prompt="Add/delete a task"

if [ "$height" -gt 20 ]; then height=30; fi

cmd=$(cat "$file" | dmenu $@ -l "$height" -p "$prompt:" -fn terminus-12 -h 30 -sb "#4d97ff" -nb "#000000" -sb "#4d97ff" -sf "#19262b" -o 0.9 -y 35 -w 900 -x 235 )

while [ -n "$cmd" ]; do
	grep -q "^$cmd" $file
	if [ $? = 0 ]; then
		grep -v "^$cmd" $file > /tmp/todo
		mv /tmp/todo $file
		height=$((height-1))
	else
		echo "$cmd" >> $file
		height=$((height+1))
	fi
	if [ "$height" -gt 20 ]; then height=20; fi
	cmd=$(cat $file | dmenu $@ -l "$height" -p "$prompt:" -fn terminus-12 -h 30 -sb "#4d97ff" -nb "#000000" -sb "#4d97ff" -sf "#19262b" -o 0.9 -y 35 -w 900 -x 235 )
done

exit 0
