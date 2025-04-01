#!/usr/bin/env bash

# Notes:
#tail -n 5 $file # You can use this to obtain the contents of a file

#results=$(cat "$file" | grep "Firefox") # You can use grep awk and similar commands to filter
#echo "$results"

# The following separates the lines (cuts) by space (' ') and only displays the 1st and 4th.
# Trim (tr) by delimeter "[ gets rid of the character "["
#results=$(cat "$file" | cut -d' ' -f1,4 | tr -d "[")
#echo "$results"

file="/var/log/apache2/access.log.1"

results=$(cat /var/log/apache2/access.log.1 | grep "GET /page2" | awk '{print $1, $7}' | sed 's|/||')
echo "$results"
