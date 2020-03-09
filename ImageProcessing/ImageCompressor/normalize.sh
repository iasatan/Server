#!/bin/bash

#create database for original image sizes
touch ~/HDD/ImageCompressor/images.txt

for f in "."/*
	do
		echo $(identify "$f")>>~/HDD/ImageCompressor/images.txt
	done

#rename them
ls -v | cat -n | while read n f; do mv -n "$f" "image-$n.jpg"; done 

#resize them to same resolution
for f in "."/*
	do
		picture=$(identify "$f")
		array=($picture)
		size=$(tr 'x' ' ' <<<"${array[2]}")
		size=($size)
		x=${size[0]}
		x=$((6000-"$x"))
		x=$(("$x"/2))
		y=${size[1]}
		y=$((6000-"$y"))
		y=$(("$y"/2))
		convert "$f" -border "$x"x"$y" "$f"
	done
