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

ps -eo pid,user,stime,cmd
#Perform Real-time Process Monitoring Using Watch Utility
watch -n 1 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
