. (Join-Path $PSScriptRoot Apache-Logs.ps1)

$log =  findIPsMatchingApacheLog("index", ' 404 ', "Chrome")
$log