#!/bin/bash

function add {
	echo "$(mp3info -p %t "$1")" # >> /srv/dev-disk-by-label-120GB/torrent/music/"$(mp3info -p %a "$1")".txt
}

function check {
	local artist=$(mp3info -p %a "$1")
	local title=$(mp3info -p %t "$1")
	return $(grep -cs "$title" /srv/dev-disk-by-label-120GB/torrent/music/"$artist".txt)
}
function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
				if [[  $(check "$f") -eq 0 ]]; then
					add "$f"
				fi
			fi
		done
}
iterate
