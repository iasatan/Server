#!/bin/bash

for f in "."/*
	do
		file=$(echo "${f:2}" | tr '[:upper:]' '[:lower:]' | tr -dc '[:alpha:]')
		while IFS='' read -r line || [[ -n "$line" ]]; do
   		if [[ "$line" == *" "* ]]; then
   			line=$(echo "$line" | tr '[:upper:]' '[:lower:]' | tr -dc '[:alpha:]')
   			echo "$line" >> /mnt/846543cd-d9c6-4eb5-8c8c-aeee3951834e/asd/"${file::-3}".txt
   		fi
	done < "$f"
done