maxX=4068
maxY=4068

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
