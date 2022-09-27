#!/bin/bash

set -eu
set -o pipefail

# take timestamp when script is launched
# find list of processes
# filter said list by timestamps when they launched
# write to text file
# loop it

## New solution
#save timestamp when script started
#read each line of output of `ps`
#get deltaTime of script start time to now
#if the value in the `etimes` column is greater than scriptStartElipsedTime >
#	then write that whole line to text file.
#continue loop until output from `ps` has finished.

initial_timestamp=$(date +%H:%M)
echo $initial_timestamp

ps -aeo pid,user,start,cmd | while read -r line; do
	echo "$line"
done 
#done > temp.txt

## How to print each character of a line
#echo "$line" | sed -e 's/\(.\)/\1\n/g'
