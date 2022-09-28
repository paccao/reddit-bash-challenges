#!/bin/bash

set -eu
set -o pipefail

initial_timestamp=$(date +%s) #EPOCH time format
default_sleep_time=1

set +u
sleep_time="${1:-$default_sleep_time}"

echo "Status: arg: [$1]" 1>&2
echo "Status: sleep_time: [$sleep_time]" 1>&2

set -u

sleep $sleep_time

ps -aeo pid,user,start,comm --no-headers | while read -r line; do
	pid=$(echo "$line" | grep -v ps | awk '{print $1}')
	process_start_timestamp=$(stat -c %Y /proc/$pid)
	if [[ $process_start_timestamp > $initial_timestamp ]]; then
		echo "Status: Process which started after script start found. Process timestamp: $process_start_timestamp - Initial timestamp: $initial_timestamp (In EPOCH format)" >&2
		echo $line
	fi
done > output.txt
 
echo "Initial timestamp: $initial_timestamp"
