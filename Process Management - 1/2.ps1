clear

$task2 = Get-Process | Where-Object { $_.Stopped -inotmatch "system32" } | Select Path
$task2 | Out-String