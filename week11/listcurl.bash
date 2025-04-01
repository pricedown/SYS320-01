#!/usr/bin/env bash

allLogs=""
file=/var/log/apache2/access.log.1
function getAllLogs() {
	allLogs=$(cat "$file")
}

function getCurls() {
	curls=$(echo "$allLogs" | grep "curl/" | awk '{print $1, $12}' | uniq -c)
}

getAllLogs
getCurls
echo "$curls"
