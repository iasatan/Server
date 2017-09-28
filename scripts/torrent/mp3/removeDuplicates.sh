#!/bin/bash

function add {
	artist=$(mp3infov2 -p %a "$1")
	title=$(mp3infov2 -p %t "$1")
	echo "$title"  >> /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/music/"$artist".txt
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
	echo $(grep -c "$title" /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/music/"$artist".txt)
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
