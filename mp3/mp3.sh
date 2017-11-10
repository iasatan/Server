#!/bin/bash
basedir = "/media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/linuxScripts/mp3";
if [[ $(grep -c "$PWD##*/" "$basedir"/stored.txt) -lt 1 ]]; then
    echo "removeNonMusic"
    bash "$basedir"/removeNonMusic.sh
    echo "removeArtists"
    bash "$basedir"/removeArtists2.sh "$basedir"/artists.txt
	echo "removeShortOrLongMusic"
    bash "$basedir"/removeShortOrLongSongs.sh
    echo "removeArtists2"
    bash "$basedir"/removeArtists.sh
    echo "removeDuplicates"
    bash "$basedir"/removeDuplicates.sh
    echo "removeEmptyDirs"
    find . -type d -empty -delete -print
    directory=${PWD##*/}
    echo "$directory" >> "$basedir"/stored.txt
    cd "$basedir"
    echo "commiting to git"
    git pull
    git add .
    git commit -m "$directory"" added"
    git push
fi