#!/bin/bash
function delete {
	artist=$(mp3infov2 -p %a "$@")
	echo "removed bad artist" "$artist"
	rm -f "$@"
}
function check {
	artist=$(mp3infov2 -p %a "$1")
	return $(grep -c "$artist" /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/artists.txt)
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
