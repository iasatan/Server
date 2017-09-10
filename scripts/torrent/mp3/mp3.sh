echo "removeNonMusic"
bash ../Server/scripts/torrent/mp3/removeNonMusic.sh
echo "removeArtists"
bash ../Server/scripts/torrent/mp3/removeArtists.sh
echo "removeDuplicates"
bash ../Server/scripts/torrent/mp3/removeDuplicates.sh
find . -type d -empty -delete -print
