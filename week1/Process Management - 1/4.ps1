clear

$runningChrome = Get-Process | Where-Object { $_.ProcessName -like "chrome" }

if ($runningChrome) { 
    $task4 = $runningChrome
    $runningChrome | Stop-Process 
} else {
    $task4 = Start-Process chrome.exe "--new-window https://www.champlain.edu"
}

$task4 | Out-String