#!/bin/bash
if [[ $(grep -c "$PWD##*/" /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/stored.txt) -lt 1 ]]; then
    echo "removeNonMusic"
    bash /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/removeNonMusic.sh
    echo "removeArtists"
    bash /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/removeArtists2.sh /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/artists.txt
	echo "removeShortOrLongMusic"
    bash /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/removeShortOrLongSongs.sh
    echo "removeArtists2"
    bash /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/removeArtists.sh
    echo "removeDuplicates"
    bash /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/removeDuplicates.sh
    echo "removeEmptyDirs"
    find . -type d -empty -delete -print
    directory=${PWD##*/}
    echo "$directory" >> /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server/scripts/torrent/mp3/stored.txt
    cd /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/music/Server
    echo "commiting to git"
    git pull
    git add .
    git commit -m "$directory"" added"
    git push --all
fi
