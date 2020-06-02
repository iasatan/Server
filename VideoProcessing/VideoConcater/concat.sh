#!/bin/bash

for file in *
do
	echo "file" "$file">>videos.txt
done

#ffmpeg -f concat -safe 0 -i videos.txt -c:v libx264 -c:a copy output.mov
ffmpeg -f concat -safe 0 -i videos.txt -c:v copy -c:a copy output.mov
