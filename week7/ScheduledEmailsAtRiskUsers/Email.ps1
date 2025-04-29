$passwordFile = Join-Path -Path $PSScriptRoot -ChildPath "password.txt"

function SendAlertEmail($Body) {
    $From = "joseph.isaacs@mymail.champlain.edu"
    $To = "joseph.isaacs@mymail.champlain.edu"
    $Subject = "Suspicious Activity"

    $plainPassword = Get-Content -Path $passwordFile -Raw
    $Password = $plainPassword | ConvertTo-SecureString -AsPlainText -Force
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -Port 587 -UseSsl -Credential $Credential
}