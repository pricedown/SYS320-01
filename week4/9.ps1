﻿clear

cd C:\xampp\apache\logs
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '
$regex = [regex] "[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}"
$ipsUnorganized = $regex.Matches($notfounds)
$ips = @()
for ($i = 0; $i -lt $ipsUnorganized.Count; $i++) {
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value }
}
Write-Host $ips.Count