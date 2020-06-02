#!/bin/bash

for file in *.avi
do
	filename="${file%.*}"
	ffmpeg -i "$file" -vf deshake "$filename".mov
	rm "$file"
done
for file in *
do
	echo "file" "$file">>videos.txt
done

ffmpeg -f concat -safe 0 -i videos.txt -c:v copy -c:a copy "$(date +'%Y..%m..%d') Bike Dashcam Miskolc".mov