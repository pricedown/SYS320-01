clear

$configPath = "C:\Users\champuser\Desktop\SYS320-01\week7\ScheduledEmailsAtRiskUsers\configuration.txt"

function readConfiguration($cfgPath) {
    $content = Get-Content -Path $cfgPath
    return $content
}

function changeConfiguration($cfgPath, $daysNum, $time) {
        "$daysNum`n$time" | Out-File -FilePath $cfgPath
}

function configurationMenu() {
    $prompt = "Select action:
0 -  Exit the program
1 -  Show configuration
2 -  Change configuration
";

    $operation = $true
    while ($operation) {
        Write-Host $prompt | Out-String
        $choice = Read-Host

        if ($choice -eq 0) {
            Write-Host "Goodbye" | Out-String
            $operation = $false
            exit
        }

        elseif ($choice -eq 1) {
            readConfiguration($configPath)
            Write-Host $content | Out-String
            continue
        }

        elseif ($choice -eq 2) {
            $daysNum = Read-Host -Prompt "Please input the amount of days to send the warning"
            $time = Read-Host -Prompt "Please input the time of day for the automated execution time"
            changeConfiguration($configPath, $daysNum, $time)
        
            continue
        }

        else {
            Write-Host "Input not recognized" | Out-String
        }
    }
}

configurationMenu