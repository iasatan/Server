#!/bin/bash

function add {
	artist=$(mp3infov2 -p %a "$1")
	title=$(mp3infov2 -p %t "$1")
	echo "$title"  >>/media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/linuxScripts/mp3/goodMusic/"$artist".txt
    echo "$title"
}

function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
					add "$f"
			fi
		done
}
find . -type d -empty -delete -print
iterate
directory=${PWD##*/}
 echo "$directory" >> /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/linuxScripts/mp3/storedGood.txt
