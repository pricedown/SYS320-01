#!/usr/bin/env bash

iocPage="10.0.17.6/IOC.html"

html=$(curl -sL $iocPage)
cleaned=$(echo "$html" | sed 's/<[^>]*>//g' | sed '/^[[:space:]]*$/d' | tr -d '\t' | tr -d '\r')
table=$(echo "$cleaned" | sed '0,/Description/d')
patterns=$(echo "$table" | while read -r pattern && read -r description; do
    echo "$pattern"
done)

echo "$patterns" >IOC.txt
