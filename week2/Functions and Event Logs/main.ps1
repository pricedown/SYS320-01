. (Join-Path $PSScriptRoot eventlogs.ps1)

clear

# Get logins and logoffs from the last 15 days
$loginoutsTable = getLoginoutsSinceDays(15)
$loginoutsTable

# Get start ups and shut downs from the last 25 days
$startupdowns = getStartupdownsSince(25)
$startupdowns