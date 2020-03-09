f=$(identify 1.jpg)

array=($f)
size=$(tr 'x' ' ' <<<"${array[2]}")
size=($size)
x=${size[0]}
x=$((6000-"$x"))
x=$(("$x"/2))
y=${size[1]}
y=$((6000-"$y"))
y=$(("$y"/2))
convert 1.jpg -border "$x"x"$y" 1border.jpg