clear

$configPath = Join-Path -Path $PSScriptRoot -ChildPath "configuration.txt"

function readConfiguration($cfgPath) {
    if (Test-Path $cfgPath) {
        $content = Get-Content -Path $cfgPath
        $config = [pscustomobject]@{
            Days = $content[0]
            ExecutionTime = $content[1]
        }
        return $config
    } else {
        Write-Host "Configuration file not found." | Out-String
        return $null
    }
}

function changeConfiguration($cfgPath, $daysNum, $time) {
    "$daysNum`n$time" | Out-File -FilePath $cfgPath
    Write-Host "Configuration Changed" | Out-String
}

function configurationMenu() {
    $prompt = @"
Please choose your operation:
1 - Show Configuration
2 - Change Configuration
3 - Exit
"@

    $operation = $true
    while ($operation) {
        Write-Host $prompt | Out-String
        $choice = Read-Host "Enter your choice"

        switch ($choice) {
            '1' {
                $config = readConfiguration $configPath
                if ($config) {
                    $table= $config | Format-Table | Out-String
                    Write-Host "$table" | Out-String
                }
            }
            '2' {
                while ($true) {
                    $daysNum = Read-Host "Enter the number of days for which the logs will be obtained"
                    if ($daysNum -match '^\d+$') {
                        break
                    }
                    Write-Host "Invalid input" | Out-String
                }

                while ($true) {
                    $time = Read-Host "Enter the daily execution time of the script"
                    if ($time -match '^\d{1,2}:\d{2}\s?(AM|PM)$') {
                        break
                    }
                    Write-Host "Invalid input" | Out-String
                }
              
                changeConfiguration $configPath $daysNum $time
            }
            '3' {
                Write-Host "Goodbye"
                $operation = $false
            }
            default {
                Write-Host "Input not recognized" | Out-String
            }
        }
    }
}

configurationMenu