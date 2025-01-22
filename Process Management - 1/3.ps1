clear

$task3 = Get-Service | Where-Object { $_.Status -ilike "Stopped" } | Sort -Property Name
$task3 | Export-Csv -Path ./hidden-result
$task3 | Out-String