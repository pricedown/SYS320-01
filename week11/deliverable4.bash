#!/usr/bin/env bash

allLogs=""
file=/var/log/apache2/access.log.1
function getAllLogs() {
    allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}

function getPageAccess() {
    pagesAccessed=$(echo "$allLogs" | cut -d' ' -f3 | sort | uniq -c)
}

getAllLogs
getPageAccess
echo "$pagesAccessed"
