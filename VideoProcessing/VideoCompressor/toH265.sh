#!/bin/bash

for file in *.mp4 *.mov *.avi
do
	filename="${file%.*}"
	ffmpeg -i "$file" -c:v libx265 -c:a copy "$filename"_265.mp4
	rm "$file"
done
