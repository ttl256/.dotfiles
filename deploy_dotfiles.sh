#!/usr/bin/env bash

FILE="$1"
SCRIPT="$2"
[ -z "$FILE" ] && echo Provide name of a file with devices && exit 1
[ -z "$SCRIPT" ] && echo Provide name of a file with script to execute && exit 1
DEVICES=$(cat $FILE)
NUM_OF_DEVICES=$(echo $(echo $DEVICES | wc -w))
LOG_FILE="$HOME/deploy_dotfiles_$(date +%Y%m%d_%T | tr -d ":").log"
touch $LOG_FILE

i=0
max_parallel=50
current_parallel=0
for device in $DEVICES; do
	i=$((i+1))
	current_parallel=$((current_parallel+1))
	echo [$i/$NUM_OF_DEVICES] $device
	(
		output=$(ssh -T -o "StrictHostKeyChecking=no" -o "ConnectTimeout=4" -o "PasswordAuthentication=no" $device < "$SCRIPT" 2>&1)
		success=$?
		flock $LOG_FILE
		if [ $success -ne 0 ]; then
			echo -e "---\n$device FAIL\n---\n$output" >> $LOG_FILE
			echo -e "Error: $device\n$output"
		else
			echo -e "---\n$device OK\n---\n$output" >> $LOG_FILE
			echo "Done: $device"
		fi
	) &
	if [ $current_parallel -eq $max_parallel ]; then
		wait
		current_parallel=0
	fi
done
wait
echo "All done"
