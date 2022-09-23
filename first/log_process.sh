#!/bin/bash

set -eu
set -o pipefail

# take timestamp when script is launched
# find list of processes
# filter said list by timestamps when they launched
# write to text file
# loop it

initial_timestamp=$(date +%H:%M)
echo $initial_timestamp

ps -aeo pid,user,start,cmd | while read -r line; do
	echo "$line" | sed -e 's/\(.\)/\1\n/g'
#done > temp.txt
done 

#while read -r line; do
#	for (( i=0; i<${#line}; i++ )); do
#		echo "${line:$i:1}"
#	done
#done < temp.txt
