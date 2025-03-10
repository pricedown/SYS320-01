function getApacheLogs() {
    $logs = Get-Content (Join-Path $PSScriptRoot "access.log")

    $fullTable = @()
    for ($i = 0; $i -lt $logs.Length; $i++) {
        $words = $logs[$i].Split(" ");

        $fullTable += [pscustomobject]@{"IP" = $words[0];`
                                        "Time" = $words[3].Trim("[");`
                                        "Method" = $words[5].Trim('"');`
                                        "Page" = $words[6];`
                                        "Protocol" = $words[7].Trim('"');`
                                        "Response" = $words[8];`
                                        "Referrer" = $words[10];`
        }
    }

    return $fullTable;
}

getApacheLogs | Format-Table -AutoSize -Wrap