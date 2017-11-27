#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ "$line" == *" "* ]]; then
		line=$(echo "$line" | tr '[:upper:]' '[:lower:]' | tr -dc '[:alpha:]')
		echo "$line" >> /mnt/846543cd-d9c6-4eb5-8c8c-aeee3951834e/artists.txt
	fi
done < "$1"