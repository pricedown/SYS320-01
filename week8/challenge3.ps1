. (Join-Path $PSScriptRoot .\challenge1.ps1)
. (Join-Path $PSScriptRoot .\challenge2.ps1)

clear

function getIndicatedLogs() {
    $logs = getApacheLogs
    $IOC = getIOC

    # $indicatedLogs = @()
    for ($i = 1; $i -lt $logs.Length; $i++) {
        $pattern = $IOC[$i].Pattern
        $matchingLogs = $logs | Where-Object { $_."Page" -ilike "*$pattern*" }
        $indicatedLogs += $matchingLogs

        # $pattern
        # $matchingLogs
    }
    return $indicatedLogs
}


getIndicatedLogs | Format-Table -AutoSize -Wrap