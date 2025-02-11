function ApacheLogs() {
     $tableRecords = @()
     $logsUnformatted = Get-Content C:\xampp\apache\logs\access.log


     for ($i = 0; $i -lt $logsUnformatted.Count; $i++) {
        $words = $logsUnformatted[$i].Split(" ");

        #for ($n = 0; $n -lt $words.Count; $n++) { Write-Host "$n : " + $words[$n] }
               
        $tableRecords += [pscustomobject]@{ "IP" = $words[0]; `
                                            "Time" = $words[3].Trim('['); `
                                            "Method" = $words[5].Trim('"'); `
                                            "Page" = $words[6]; `
                                            "Protocol" = $words[7].Trim('"'); `
                                            "Response" = $words[8]; `
                                            "Referrer" = $words[10]; `
                                            "Client" = $words[11..-1]; }
     }
     
     return $tableRecords | Where-Object { $_.IP -ilike "10.*" } 
}