#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get CPU usage percentage
# Uses top in batch mode for one iteration and processes the output
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get Memory usage percentage
# Uses free command and processes the output with awk
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

# Log the data with timestamp
echo "$TIMESTAMP | CPU: $CPU_USAGE% | Mem: $MEM_USAGE%" >> "$LOG_FILE"