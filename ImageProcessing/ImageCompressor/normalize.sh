#!/bin/bash

#create database for original image sizes
touch ~/Downloads/linuxScripts/ImageProcessing/ImageCompressor/images.txt

for f in "."/*
	do
		echo $(identify "$f")>>~/Downloads/linuxScripts/ImageProcessing/ImageCompressor/images.txt
	done

#rename them
ls -v | cat -n | while read n f; do mv -n "$f" "image-$n.jpg"; done 

for file in *.jpg; do  convert "$file" "$file"; done

maxX=0
maxY=0

for f in "."/*
	do
		picture=$(identify "$f")
		array=($picture)
		size=$(tr 'x' ' ' <<<"${array[2]}")
		size=($size)
		x=${size[0]}
		if [[ "$maxX" < "$x" ]]; then
			maxX="$x"
		fi
		y=${size[1]}
		if [[ "$maxY"< "$y" ]]; then
			maxY="$y"
		fi
	done

#resize them to same resolution
for f in "."/*
	do
		picture=$(identify "$f")
		array=($picture)
		size=$(tr 'x' ' ' <<<"${array[2]}")
		size=($size)
		x=${size[0]}
		x=$(("$maxX"-"$x"))
		x=$(("$x"/2))
		y=${size[1]}
		y=$(("$maxY"-"$y"))
		y=$(("$y"/2))
		convert "$f" -border "$x"x"$y" "$f"
	done
