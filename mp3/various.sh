#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ "$line" == *" - "* ]]; then
    	IFS="-" read -a music <<< "$line"
    	echo "${music[0]}"  >> /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/linuxScripts/mp3/music/"${music[1]}".txt
        echo "${music[1]}"  >> /media/iasatan/846543cd-d9c6-4eb5-8c8c-aeee3951834e/linuxScripts/mp3/music/"${music[0]}".txt
    fi
done < "$1"
