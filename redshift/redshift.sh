#!/bin/bash

redshift -O 3500

if [[ $(date +%H) -gt 16 ]]; then
	redshift -O 3000
	if [[ $(date +%H) -gt 17 ]]; then
		redshift -O 2500
	fi
fi
