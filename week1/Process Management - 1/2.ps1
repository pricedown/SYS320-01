clear

$task2 = Get-WmiObject -Class Win32_Process | Where-Object { $_.Path -inotlike "*system32*" }
$task2 | Select-Object Path | Out-String 