#!/bin/bash

link="http://10.0.17.6/Courses.html"

fullPage=$(curl -sL "$link")

toolOutput=$(echo "$fullPage" | xmlstarlet format --html --recover 2>/dev/null |
    xmlstarlet sel --template --copy-of "//table[@id='grid']/tbody/tr")

echo "$toolOutput" | sed 's/<\/tr>/\n/g' |
    sed -e 's/&amp;/&/g' \
        -e 's/<tr[^>]*>//g' \
        -e 's/<td[^>]*>//g' \
        -e 's/<\/td>/;/g' \
        -e 's/<nobr>//g' \
        -e 's/<\/nobr>//g' \
        -e 's/<a[^>]*>//g' \
        -e 's/<\/a>//g' \
        -e 's/^[[:space:]]*//;s/[[:space:]]*$//' \
        -e '/^$/d' \
        >courses.txt
