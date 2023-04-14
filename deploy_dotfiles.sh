#!/usr/bin/env bash

FILE="$1"
[ -z "$FILE" ] && echo Provide name of a file with devices && exit 1
DEVICES=$(cat $FILE)
NUM_OF_DEVICES=$(echo $(echo $DEVICES | wc -w))

i=0
for device in $DEVICES; do
	i=$((i+1))
	echo [$i/$NUM_OF_DEVICES] $device
	( ssh -T -o "StrictHostKeyChecking=no" $device < $HOME/provision_dotfiles.sh; echo "Done $device" ) &
done
wait
echo "All done"
