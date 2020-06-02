#!/bin/bash

for file in *
do
	filename="${file%.*}"
	ffmpeg -i "$file" -c:v libx264 -c:a copy "$filename".mov
	rm "$file"
done
