#!/bin/bash
basedir="/home/iasatan/NonSynced/linuxScripts/mp3";
if [[ $(grep -c "$PWD##*/" "$basedir"/stored.txt) -lt 1 ]]; then
    echo "removeNonMusic\n\n"
    bash $basedir/removeNonMusic.sh
    echo "removeArtists\n\n"
    bash "$basedir"/removeArtists2.sh "$basedir"/artists.txt
	echo "removeShortOrLongMusic\n\n"
    bash "$basedir"/removeShortOrLongSongs.sh
    echo "removeArtists2\n\n"
    bash "$basedir"/removeArtists.sh
    echo "Remove Bad Genres\n\n"
    bash "$basedir"/removeBadGenres.sh
    echo "removeDuplicates\n\n"
    bash "$basedir"/removeDuplicates.sh
    echo "removeEmptyDirs\n\n"
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
