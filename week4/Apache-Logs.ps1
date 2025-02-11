function findIPsMatchingApacheLog($pageVisited, $httpCode, $webBrowser) {
     $matchingIPs = @()

     # Get relevant logs
     $apacheLog = "C:\xampp\apache\logs\access.log"
     $relevantLogs = Get-Content $apacheLog | Select-String '$pageVisited', ' $httpCode ', '$webBrowser'

     # https://stackoverflow.com/questions/31178400/regex-to-extract-an-ip-address-from-a-string
     $regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
     $relevantIPs = $regex.Matches($relevantLogs)

     # Loop to extract ips
     for ($i = 0; $i -lt $relevantIPs.Count; $i++) {
        $matchingIPs += [pscustomobject]@{ "IP" = $relevantIPs[$i].Value }
     }
     
     $uniqueIPs = $matchingIPs
     return $uniqueIPs
}