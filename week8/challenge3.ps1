. (Join-Path $PSScriptRoot .\challenge1.ps1)
. (Join-Path $PSScriptRoot .\challenge2.ps1)

clear

function getIndicatedLogs() {
    $logs = getApacheLogs
    $IOC = getIOC

    $indicatedLogs = @()
    for ($i = 0; $i -lt $IOC.Length; $i++) {
        $pattern = $IOC[$i].Pattern
        $indicatedLogs += $logs | Where-Object { $_.Page -ilike "*$pattern*" }
    }
    $indicatedLogs = Get-Unique -InputObject $indicatedLogs

    return $indicatedLogs
}

getIndicatedLogs | Format-Table -AutoSize -Wrap