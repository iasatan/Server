#!/bin/bash
function delete {
	artist=$(mp3infov2 -p %a "$@")
	echo "removed bad artist" "$artist"
	rm -f "$@"
}
function check {
	artist=$(mp3infov2 -p %a "$1")
	return $(grep -c "$artist" /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/artists.txt)
}
function iterate {
	for f in "."/*
	 do
		if [[ -d "$f" ]]; then
			cd "$f"
			iterate
			cd ..
		elif [[ -f "$f" ]]; then
			check "$f" || delete "$f"
		fi
	done
}
iterate
