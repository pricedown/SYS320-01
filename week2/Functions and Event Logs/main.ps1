. (Join-Path $PSScriptRoot eventlogs.ps1)

clear

getLoginoutsSinceDays(14)

#Get-EventLog System -source Kernel-General
getStartupdownsSince(25)