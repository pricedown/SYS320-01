. (Join-Path $PSScriptRoot Apache-Logs.ps1)

clear

$logs = ApacheLogs
$logs | Format-Table -AutoSize -Wrap