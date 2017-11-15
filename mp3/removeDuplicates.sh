#!/bin/bash

function add {
	artist=$(mp3infov2 -p %a "$1")
	title=$(mp3infov2 -p %t "$1")
	echo "$title"  >> /mnt/846543cd-d9c6-4eb5-8c8c-aeee3951834e/linuxScripts/mp3/music/"$artist".txt
}

function delete {
	artist=$(mp3infov2 -p %a "$@")
	if ! [[ -z "$artist" ]]; then
		echo "$@ duplicate deleted"
		rm -f "$@"
	fi
}

function check {
	artist=$(mp3infov2 -p %a "$1")
	title=$(mp3infov2 -p %t "$1")
	echo $(grep -c "$title" /mnt/846543cd-d9c6-4eb5-8c8c-aeee3951834e/linuxScripts/mp3/music/"$artist".txt)
}

function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
				if [[ $(check "$f") -gt 0 ]]; then
					delete "$f"
				else 
					add "$f"
				fi
			fi
		done
}
iterate
