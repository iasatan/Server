#!/bin/bash

iphonex=1334
iphoney=750
fullhdx=1920
fullhdy=1080

defaultx="$iphonex"
defaulty="$iphoney"

echo "$defaultx"
echo "$defaulty"
#cd /home/iasatan/HDD/MoveIt

for f in *.JPG
	do
    	echo "$f"
		picture=$(identify "$f")
		array=($picture)
		size=$(tr 'x' ' ' <<<"${array[3]}")
		size=($size)
		x=${size[0]}
		y=${size[1]}
		if (( x > y )); then
			if (( x > "$defaultx" )); then
				if (( y > "$defaulty" )); then
					echo "$f good"
					convert "$f" -resize "$defaultx" "$f"
					mv "$f" mini/"$f"
				fi
			fi
		elif (( x < y )); then
			if (( y > "$defaultx" )); then
				if (( x > "$defaulty" )); then
					echo "$f good"
					convert "$f" -resize x"$defaultx" "$f"
					mv "$f" mini/"$f"
				fi
			fi
		fi
	done
for f in *.jpg
	do
    	echo "$f"
		picture=$(identify "$f")
		array=($picture)
		size=$(tr 'x' ' ' <<<"${array[3]}")
		size=($size)
		x=${size[0]}
		y=${size[1]}
		if (( x > y )); then
			if (( x > "$defaultx" )); then
				if (( y > "$defaulty" )); then
					echo "$f good"
					convert "$f" -resize "$defaultx" "$f"
					mv "$f" mini/"$f"
				fi
			fi
		elif (( x < y )); then
			if (( y > "$defaultx" )); then
				if (( x > "$defaulty" )); then
					echo "$f good"
					convert "$f" -resize x"$defaultx" "$f"
					mv "$f" mini/"$f"
				fi
			fi
		fi
	done
