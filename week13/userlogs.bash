#! /bin/bash

authfile="/var/log/auth.log.1"
#authfile="./auth.log"

function getLogins() {
    logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
    dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
    echo "$dateAndUser"
}

#function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
#}

# Sending logins as email - Do not forget to change email address
# to your own email address
function sendEmail() {
    echo "To: joseph.isaacs@champlain.edu" >emailform.txt
    echo "Subject: Logins" >>emailform.txt
    getLogins >>emailform.txt
    cat emailform.txt | msmtp fpaligu@champlain.edu # using msmtp because Google won't auth with ssmtp
}

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email
