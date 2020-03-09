#!/bin/bash

basedir="/home/iasatan/HDD/MoveIt";
mkdir "$basedir"
function iterate {
	for f in "."/*
		do
			if [[ -d "$f" ]]; then
				cd "$f"
				iterate
				cd ..
			elif [[ -f "$f" ]]; then
				cp "$f" "$basedir"
			fi
		done
}
iterate
