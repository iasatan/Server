for file in *.jpg; do convert $file -resize 600x800 -colorspace Gray $file; done
