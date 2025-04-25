#!/usr/bin/env bash

: >report.html
echo "<html> <body>" >>report.html
echo "Access logs with IOC indicators: " >>report.html
echo "<table>" >>report.html

cat report.txt | while read -r line; do
  echo "<tr><td>" >>report.html
  echo "$line" >>report.html
  echo "</tr></td>" >>report.html

done
echo "</table> </body> </html>" >>report.html
