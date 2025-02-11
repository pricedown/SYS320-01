function ApacheLogs() {
     $tableRecords = @()
     $logsUnformatted = Get-Content C:\xampp\apache\logs\access.log


     for ($i = 0; $i -lt $logsUnformatted.Count; $i++) {
        $words = $logsUnformatted[$i].Split(" ");

        #for ($n = 0; $n -lt $words.Count; $n++) { Write-Host "$n : " + $words[$n] }
               
        $tableRecords += [pscustomobject]@{ "IP" = $words[0]; `
                                            "Time" = $words[3]; `
                                            "Method" = $words[5].Trim('['); `
                                            "Page" = $words[6].Trim('"'); `
                                            "Protocol" = $words[7]; `
                                            "Response" = $words[8]; `
                                            "Referrer" = $words[9]; `
                                            "Client" = $words[11..($words.LastIndexOf('"'))]; }
     }
     
     return $tableRecords | Where-Object { $_.IP -ilike "10.*" }
}

$yes = ApacheLogs
$yes | Format-Table -AutoSize -Wrap