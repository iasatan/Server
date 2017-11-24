#!/bin/bash

function test {
	artist=$(mp3infov2 -p %a "$1")
	title=$(mp3infov2 -p %t "$1")
	genre=$(mp3infov2 -p %g "$1")
	echo "$genre"  >> /mnt/846543cd-d9c6-4eb5-8c8c-aeee3951834e/genres.txt
}
function check {
	genre=$(mp3infov2 -p %g "$1")
    echo $(grep -c "$genre" /mnt/846543cd-d9c6-4eb5-8c8c-aeee3951834e/genres.txt)
}

function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
					if [[ $(check "$f") -lt 1 ]]; then
    					test "$f"
			    	fi
			fi
		done
}
iterate
