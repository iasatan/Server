#!/bin/bash
echo "removeNonMusic"
bash ../Server/scripts/torrent/mp3/removeNonMusic.sh
echo "removeArtists"
bash ../Server/scripts/torrent/mp3/removeArtists.sh
echo "removeArtists2"
bash ../Server/scripts/torrent/mp3/removeArtists2.sh ../Server/scripts/torrent/mp3/artists.txt
echo "removeDuplicates"
bash ../Server/scripts/torrent/mp3/removeDuplicates.sh
echo "removeEmptyDirs"
find . -type d -empty -delete -print
echo $PWD >> ../Server/scripts/torrent/mp3/stored.txt
cd ../Server
git add .
git commit -m "$PWD added"
git push --all
