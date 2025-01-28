clear

$task1 = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "Ethernet0" }).IPAddress
$task2 = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "Ethernet0" }).PrefixLength
$task3 = Get-WmiObject -List | Where-Object { $_.Name -ilike "Win32_Net*" }
$task4 = $task3 | Sort 
$task5 = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object {$_.DHCPEnabled -eq $true} | Select-Object DHCPServer
$task6 = $task5 | Format-Table -HideTableHeaders
$task7 = (Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "Ethernet*" }).ServerAddresses[0]