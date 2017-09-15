#!/bin/bash
if [[ $(grep -c "$PWD" ../Server/scripts/torrent/mp3/stored.txt) -lt 1 ]]; then
    vcgencmd measure_temp
    echo "removeNonMusic"
    bash ../Server/scripts/torrent/mp3/removeNonMusic.sh
    vcgencmd measure_temp
    echo "removeArtists"
    bash ../Server/scripts/torrent/mp3/removeArtists.sh
    vcgencmd measure_temp
    echo "removeArtists2"
    bash ../Server/scripts/torrent/mp3/removeArtists2.sh ../Server/scripts/torrent/mp3/artists.txt
    vcgencmd measure_temp
    echo "removeDuplicates"
    bash ../Server/scripts/torrent/mp3/removeDuplicates.sh
    vcgencmd measure_temp
    echo "removeEmptyDirs"
    find . -type d -empty -delete -print
    directory=$PWD
    echo $PWD >> ../Server/scripts/torrent/mp3/stored.txt
    cd ../Server
    echo "commiting to git"
    git add .
    git commit -m "$directory"" added"
    git push --all
    vcgencmd measure_temp
fi