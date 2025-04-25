#!/usr/bin/env bash

logFile=$1
iocFile=$2

foundLines=$(cat $iocFile | while read -r ioc; do
    cat $logFile | grep $ioc | while read -r line; do
        ip=$(echo "$line" | awk '{print $1}')
        date=$(echo "$line" | awk '{print $4}')
        date=$(echo "$date" | cut -d'[' -f2)
        page=$(echo "$line" | awk '{print $7}')
        echo "$ip $date $page"
    done
done)

foundLines=$(echo "$foundLines" | uniq)
echo "$foundLines"
