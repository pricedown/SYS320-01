
function getLoginoutsSinceDays($SinceDays) {
    $loginouts = Get-EventLog System -source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-$SinceDays)
    $loginoutsTable = @() # Empty array to fill out customly

    for ($i = 0; $i -lt $loginouts.Count; $i++) {
        $time = $loginouts[$i].TimeGenerated

        $id = $loginouts[$i].EventID
    
        $event = ""
        if ($id -eq 7001) {$event = "Logon"}
        if ($id -eq 7002) {$event = "Logoff"}

        # https://alkanesolutions.co.uk/2023/04/04/use-powershell-to-find-the-user-profile-last-use-time
        $sid = $loginouts[$i].ReplacementStrings[1]
        $objSID = New-Object System.Security.Principal.SecurityIdentifier($sid)
        $user = $objSID.Translate([System.Security.Principal.NTAccount])

        $loginoutsTable += [pscustomobject]@{"Time" = $time;`
                                             "Id" = $id;`
                                             "Event" = $event;`
                                             "User" = $user;
                                            }
    }
    return $loginoutsTable
}

function getStartupdownsSince($SinceDays) {
    $startupdowns = Get-EventLog System -After (Get-Date).AddDays(-$SinceDays) | Where-Object { ($_.EventID -eq 12) -or ($_.EventID -eq 13) }
    $startupdownTable = @() # Empty array to fill out customly

    for ($i = 0; $i -lt $startupdowns.Count; $i++) {
        $time = $startupdowns[$i].TimeGenerated

        $id = $startupdowns[$i].EventID
    
        $event = ""
        if ($id -eq 12) {$event = "Startup"}
        if ($id -eq 13) {$event = "Shutdown"}

        $startupdownTable += [pscustomobject]@{"Time" = $time;`
                                             "Id" = $id;`
                                             "Event" = $event;`
                                             "User" = "System";
                                            }
    }
    return $startupdownTable
}