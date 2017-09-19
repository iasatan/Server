#!/bin/bash

function add {
	#sleep 1
	echo "$artist $title added"
	echo "$title"  >> /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/music/"$artist".txt
}

function delete {
	function delete {
	if [[ -z "$artist" ]]; then
		echo "$@ duplicate deleted"
		rm -f "$@"
	fi
}
}

function check {
	artist=$(mp3infov2 -p %a "$1")
	title=$(mp3infov2 -p %t "$1")
	echo "$artist $title"
	return $(grep -c "$title" /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/music/"$artist".txt)
}

function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
			if [[ check "$f" -gt 0]]; then
				delete "$f"
			else 
				add "$f"
				#check "$f" && delete "$f" || add 
			fi
		done
}
iterate
