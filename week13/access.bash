#!/usr/bin/env bash
set -e
export HOME=/home/champuser
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LOGNAME=champuser

debuglog=/home/champuser/SYS320-01/week13/debug.txt

: >$debuglog
echo "Running as $(whoami)" >>$debuglog
echo "Home is $HOME" >>$debuglog
ls -l /home/champuser/.msmtprc >>$debuglog

accesslog="/home/champuser/SYS320-01/week13/fileaccesslog.txt"
access_email="/home/champuser/SYS320-01/week13/access_email.txt"

access_line="File was accessed $(date)"
echo "$access_line" >>"$accesslog"

echo "To: joseph.isaacs@mymail.champlain.edu" >"$access_email"
echo "Subject: Access" >>"$access_email"
echo "Hello, here are the accesses" >>"$access_email"
cat "$accesslog" >>"$access_email"
#tail $accesslog -n 1 >>"$access_email"
sync
cat $access_email | /usr/bin/msmtp --file=/home/champuser/.msmtprc -v joseph.isaacs@mymail.champlain.edu >>$debuglog
