#!/usr/bin/env bash

accesslog="/home/champuser/SYS320-01/week13/fileaccesslog.txt"
access_email="/home/champuser/SYS320-01/week13/access_email.txt"

access_line="File was accessed $(date)"
echo "$access_line" >>"$accesslog"

echo "To: joseph.isaacs@mymail.champlain.edu" >"$access_email"
echo "Subject: Access" >>"$access_email"
echo "$access_line" >>"$access_email"
#tail $accesslog -n 1 >>"$access_email"
cat $access_email | /bin/msmtp joseph.isaacs@mymail.champlain.edu
