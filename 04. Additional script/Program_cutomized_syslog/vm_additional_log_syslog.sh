#!/bin/bash

# should be in /var/log folder
$LOG_FILE="/var/log/process_ppid.log"

while true; do
    # through ps command, log pid and ppid
    ps aux --forest | awk -v OFS='\t' '{print $2, $3, $4, $5, $6, $8, $11, $NF}' >> $LOG_FILE
    sleep 60  # log every 1 min
done