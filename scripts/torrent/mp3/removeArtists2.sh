#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    find . -xtype f -iname *"$line"* -print -delete
    #echo "$line"
done < "$1"
