#!/bin/bash
function delete {
	#rm -f $@
    echo "$@"
}
function check {
	local artist=$(mp3info -p %a "$1")
	return $(grep -c "$artist" /srv/dev-disk-by-label-120GB/torrent/artists.txt)
}
function iterate {
	#for f in $(ls);
	for f in "."/*
	 do
		echo "$f"
		if [[ -d "$f" ]]; then
			echo "directory"
			cd "$f"
			iterate
			cd ..
		elif [[ -f "$f" ]]; then
			echo "file"
			check "$f" || delete "$f"
		fi
	done
}
find MP3* -type f -iname \*.jpg -delete -print
find MP3* -type f -iname \*.png -delete -print
find MP3* -type f -iname \*.bmp -delete -print
find MP3* -type f -iname \*.txt -delete -print
find MP3* -type f -iname \*mix* -delete -print
find MP3* -type f -iname \*edit* -delete -print
iterate
