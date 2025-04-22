#!/usr/bin/env bash

page=http://10.0.17.6/Assignment.html
html=$(curl -sL $page)

cleaned=$(echo "$html" | sed 's/<[^>]*>//g' | sed '/^[[:space:]]*$/d' | tr -d '\t' | tr -d '\r')

temp_vals=$(echo "$cleaned" | sed -n '/The Temprature Read:/, /The Pressure Read:/p' | sed -n '/[0-9]\{2\}/p')
press_vals=$(echo "$cleaned" | sed -n '/The Pressure Read:/,$p' | sed -n '/[0-9]\{2\}/p')

count=$(echo "$temp_vals" | wc -l)

for ((i = 1; i <= count; i += 2)); do
    temp=$(echo "$temp_vals" | head -n $i | tail -n 1)
    press=$(echo "$press_vals" | head -n $i | tail -n 1)
    date=$(echo "$temp_vals" | head -n $(($i + 1)) | tail -n 1)

    echo "$press $temp $date"
done
