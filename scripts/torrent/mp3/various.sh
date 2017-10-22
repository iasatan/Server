#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ "$line" == *" - "* ]]; then
    	IFS="-" read -a music <<< "$line"
    	echo "${music[0]}"  >> /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/music/"${music[1]}".txt
        echo "${music[1]}"  >> /srv/dev-disk-by-id-ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J4APRZR8-part1/red/music/Server/scripts/torrent/mp3/music/"${music[0]}".txt
    fi
done < "$1"