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

initial_timestamp=$(date +%s) #unix time format

ps -aeo pid,user,start,comm --no-headers | while read -r line; do
	pid=$(echo "$line" | grep -v ps | awk '{print $1}')
	process_start_timestamp=$(stat -c %Y /proc/$pid)
	if [[ $process_start_timestamp > $initial_timestamp ]]; then
		echo "Process: $process_start_timestamp - Initial: $initial_timestamp" >&2
		echo $line
	fi
done > log.txt
 
echo "Initial timestamp: $initial_timestamp" >&2
