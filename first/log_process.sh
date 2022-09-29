#!/bin/bash

set -eu
set -o pipefail

initial_timestamp=$(date +%s) #EPOCH time format
default_sleep_time=1

echo "Script started running at the EPOCH timestamp:" $initial_timestamp

set +u
sleep_time="${1:-$default_sleep_time}"

echo "Status: arg: [$1]" 1>&2
echo "Status: sleep_time: [$sleep_time]" 1>&2

set -u

sleep $sleep_time


ps -aeo pid,ppid=PARENT_PROCESS_ID,user,start=STARTED_AT,comm --no-headers | while read -r line; do
	pid=$(echo "$line" | grep -v ps | awk '{print $1}')
	process_start_timestamp=$(stat -c %Y /proc/$pid)
	
	if [[ $process_start_timestamp > $initial_timestamp ]]; then
		echo "Status: Process which started after script start found. Process timestamp: $process_start_timestamp - Initial timestamp: $initial_timestamp (In EPOCH format)" >&2
		echo $line
	fi
#sed -i '1s/^/$(ps -o pid,ppid=PARENT_PROCESS_ID,user,start=STARTED_AT,comm | head -n1) \n/' ./output.txt
#echo "$(echo -n $(ps -o pid,ppid=PARENT_PROCESS_ID,user,start=STARTED_AT,comm | head -n1); cat output.txt)" > output.txt
done > output.txt

