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

ps -aeo pid,user,stime,cmd | while read -r line; do
	echo "$line" ;
done > output.txt
