. (Join-Path $PSScriptRoot ..\..\week6\LocalUserManagementMenu\Event-Logs.ps1)
. (Join-Path $PSScriptRoot Configuration.ps1)
. (Join-Path $PSScriptRoot Email.ps1)
. (Join-Path $PSScriptRoot Scheduler.ps1)

# Obtaining configuration
$configuration = readConfiguration($configPath)

# Obtaining at risk users (failed login events)
$failed = getFailedLogins($configuration.Days)

# Sending at risk users as email
SendAlertEmail($failed | Format-Table | Out-String)

# Setting the script to run daily
ChooseTimeToRun($configuration.ExecutionTime)