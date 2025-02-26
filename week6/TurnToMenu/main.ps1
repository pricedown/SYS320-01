. (Join-Path $PSScriptRoot ..\..\week4\ParsingApacheLogs\Apache-Logs.ps1)
. (Join-Path $PSScriptRoot ..\..\week4\Apache-Logs.ps1)
. (Join-Path $PSScriptRoot ..\..\week6\LocalUserManagementMenu\Event-Logs.ps1)
$chromeToChamplainScript = (Join-Path $PSScriptRoot ..\..\week1\Process` Management` -` 1\4.ps1)

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 Apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Toggle chrome web browser and navigate to champlain.edu`n"
$Prompt += "9 - Exit`n"

$maxDays = 365

$operation = $true
while ($operation) {
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if ($choice -eq 9) {
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif ($choice -eq 1) {
        $logs = ApacheLogs | Select-Object -First 10
        Write-Host($logs | Format-Table | Out-String)
    }

    elseif ($choice -eq 2) {
        $failedLogins = getFailedLogins $maxDays | Select-Object -Last 10
        Write-Host($failedLogins | Format-Table | Out-String)
    }

    elseif ($choice -eq 3) {
        $failedLogins = getFailedLogins $maxDays
        $riskUsers = getFailedLogins $maxDays | Group-Object -Property User | Where-Object { $_.Count -gt 10 } | Select Name
        Write-Host($riskUsers | Format-Table | Out-String)
    }

    elseif ($choice -eq 4) {
        . $chromeToChamplainScript
    }

    else {
        Write-Host "Invalid input, please try again"
        continue;
    }
}