echo "removeNonMusic"
bash ../Server/scripts/torrent/mp3/removeNonMusic.sh
echo "removeArtists"
bash ../Server/scripts/torrent/mp3/removeArtists.sh
echo "removeArtists"
bash ../Server/scripts/torrent/mp3/removeArtists2.sh ../Server/scripts/torrent/mp3/spaceArtists.txt
echo "removeDuplicates"
bash ../Server/scripts/torrent/mp3/removeDuplicates.sh
find . -type d -empty -delete -print
echo $PWD >> ../Server/scripts/torrent/mp3/stored.txt
