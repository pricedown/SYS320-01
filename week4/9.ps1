. (Join-Path $PSScriptRoot Apache-Logs.ps1)

$log =  findIPsMatchingApacheLog("i", '404', "i")
$log