#!/bin/bash

cd /home/iasatan/HDD/MoveIt
for f in "."/*
	do
		picture=$(identify "$f")
		array=($picture)
		size=$(tr 'x' ' ' <<<"${array[2]}")
		size=($size)

		x=${size[0]}
		y=${size[1]}
		if (( x > y )); then
			if (( x > 1334 )); then
				if (( y > 750 )); then
					#echo "$f good"
					convert "$f" -resize 1334 "$f"
				fi
			fi
		elif (( x < y )); then
			if (( y > 1334 )); then
				if (( x > 750 )); then
					#echo "$f good"
					convert "$f" -resize x1334 "$f"
				fi
			fi
		fi
		#if [[ x > y ]] && [[ x > 1334 ]] && [[ y > 750 ]]; then
		#	echo "$f $size"
		#	convert "$f" -resize 1334 "$f"
		#elif [[ y>x && x>750 && y>1334 ]]; then
		#	convert "$f" -resize 750\> "$f"
		#fi

	done
