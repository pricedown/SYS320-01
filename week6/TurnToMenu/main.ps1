. (Join-Path $PSScriptRoot .week4\ParsingApacheLogs\Apache-Logs.ps1)

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 Apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start chrome web browser and navigate to champlain.edu`n"
Prompt += "9 - Exit`n"

$operation = $true
while ($operation) {
    if ($choice -eq 9) {
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    if ($choise -eq 1) {
        $logs = ApacheLogs
        $logs | Format-Table -AutoSize -Wrap

    }
}