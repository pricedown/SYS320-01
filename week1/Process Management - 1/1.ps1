clear

$task1 = Get-Process | Where-Object { $_.ProcessName -ilike "C*" }
$task1 | Out-String