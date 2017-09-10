#!/bin/bash

function add {
	echo "$artist"  >> /srv/dev-disk-by-label-120GB/torrent/music/"$title".txt
}

function delete {
	echo "$@"
	rm -f "$@"
}

function check {
	local artist=$(mp3infov2 -p %a "$1")
	local title=$(mp3infov2 -p %t "$1")
	return $(grep -cs "$title" /srv/dev-disk-by-label-120GB/Server/scripts/torrent/mp3/music/"$artist".txt)
}

function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
				check "$f" && delete "$f" || add
			fi
		done
}
iterate
