#!/bin/bash

function delete {
	echo "$@"
	rm -f "$@"
}

function check {
	local artist=$(mp3info -p %a "$1")
	local title=$(mp3info -p %t "$1")
	return $(grep -c "$title" /srv/dev-disk-by-label-120GB/music/"$artist".txt)
}

function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
				check "$f" && delete "$f"
			fi
		done
}
iterate
