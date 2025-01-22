clear

$runningChrome = Get-Process | Where-Object { $_.ProcessName -like "chrome" }

if ($runningChrome) { 
    $task4 = $runningChrome
    $runningChrome | Stop-Process 
} else {
    $task4 = Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe"
}

$task4 | Out-String