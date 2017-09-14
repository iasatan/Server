#!/bin/bash
function delete {
	echo "$@"" deleted"
	rm -f "$@"
}
function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
                length = $(mp3info -p %s "$f")
				if [[ "$lenght" -lt 120 || "$lenght" -gt 300 ]]; then
                delete "$f"
                fi
			fi
		done
}
iterate