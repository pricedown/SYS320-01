#!/usr/bin/env bash

: >report.html

echo "<html><body>" >>report.html
echo "<h2>Access Logs with IOC Indicators:</h2>" >>report.html
echo "<table>" >>report.html
echo "<tr><th>IP Address</th><th>DateTime</th><th>Request</th></tr>" >>report.html

cat report.txt | while read -r ip datetime request; do
    echo "<tr><td>$ip</td><td>$datetime</td><td>$request</td></tr>" >>report.html
done

echo "</table></body></html>" >>report.html

sudo mv report.html /var/www/html/
