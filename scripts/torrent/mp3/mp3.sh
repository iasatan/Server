#!/bin/bash
function delete {
	echo "$@"
	rm -f "$@"
}
function check {
	local artist=$(mp3info -p %a "$1")
	return $(grep -c "$artist" /srv/dev-disk-by-label-120GB/torrent/artists.txt)
}
function iterate {
	#for f in $(ls);
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
find . -type f -iname \*.jpg -delete -print
find . -type f -iname \*.png -delete -print
find . -type f -iname \*.bmp -delete -print
find . -type f -iname \*.txt -delete -print
find . -type f -iname \*mix* -delete -print
find . -type f -iname \*edit* -delete -print
find . -type f -iname \*remix* -delete -print
find . -type f -iname \*disney* -delete -print
iterate
