#! /bin/bash

authfile="/var/log/auth.log.2"

function getLogins() {
    logline=$(zcat "$authfile" | grep "systemd-logind" | grep "New session")
    dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
    echo "$dateAndUser"
}

#function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
#}
function getFailedLogins() {
    logline=$(zcat "$authfile" | grep "authentication failure")
    user=$(echo "$logline" | awk '{print $13}' | cut -d'=' -f2)
    date=$(echo "$logline" | awk '{print $1, $2}')
    dateAndUser=$(echo "$date" "$user")

    echo "$dateAndUser"
}

# Sending logins as email - Do not forget to change email address
# to your own email address
function sendEmail() {
    echo "To: joseph.isaacs@mymail.champlain.edu" >emailform.txt
    echo "Subject: Logins" >>emailform.txt
    getLogins >>emailform.txt
    cat emailform.txt | msmtp joseph.isaacs@mymail.champlain.edu # using msmtp because Google won't auth with ssmtp
}

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email
function sendFailedLoginsEmail() {
    echo "To: joseph.isaacs@mymail.champlain.edu" >failed_email.txt
    echo "Subject: Failed Logins" >>failed_email.txt
    getFailedLogins >>failed_email.txt
    cat failed_email.txt | msmtp joseph.isaacs@mymail.champlain.edu
}

function sendEmails() {
    sendEmail
    sendFailedLoginsEmail
}

sendEmails
