#!/bin/bash
if [[ $(grep -c "$PWD##*/" /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/stored.txt) -lt 1 ]]; then
    vcgencmd measure_temp
    echo "removeNonMusic"
    bash /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/removeNonMusic.sh
    vcgencmd measure_temp
    echo "removeArtists"
    bash /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/removeArtists2.sh /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/artists.txt
    vcgencmd measure_temp
	echo "removeShortOrLongMusic"
    bash /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/removeShortOrLongSongs.sh
    vcgencmd measure_temp
    echo "removeArtists2"
    bash /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/removeArtists.sh
    vcgencmd measure_temp
    echo "removeDuplicates"
    bash /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/removeDuplicates.sh
    vcgencmd measure_temp
    echo "removeEmptyDirs"
    find . -type d -empty -delete -print
    directory=${PWD##*/}
    echo "$directory" >> /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/stored.txt
    cd /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server
    echo "commiting to git"
    git pull
    git add .
    git commit -m "$directory"" added"
    git push --all
    vcgencmd measure_temp
fi
