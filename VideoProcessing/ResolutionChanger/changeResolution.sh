#!/bin/bash

iphonex=1334
iphoney=750
fullhdx=1920
fullhdy=1080

defaultx="$iphonex"
defaulty="$iphoney"


for f in *.mp4
	do
    	echo "$f"
    	x=$(mediainfo --Inform="Video;%Height%" "$f")
    	y=$(mediainfo --Inform="Video;%Width%" "$f")
    	echo "$x $y"
    	good=false;
        filename="${f%.*}"
				
		if (( x > y )); then
	        if (( x > "$defaultx" )); then
				if (( y > "$defaulty" )); then
					echo "$f good"
					good=true
					ffmpeg -i "$f" -c:v libx265 -c:a copy -vf scale=-2:"$defaultx" mini_"$filename".mp4
					rm "$f"
				fi
			fi
		elif (( x < y )); then
			if (( y > "$defaultx" )); then
				if (( x > "$defaulty" )); then
					echo "$f good"
					good=true
					ffmpeg -i "$f" -c:v libx265 -c:a copy -vf scale="$defaultx":-2 mini_"$filename".mp4
					rm "$f"
				fi
			fi
		fi
		if ((good == false )); then
		    mv "$f" mini_"$filename".mp4
		fi
	done
