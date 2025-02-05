clear

cd C:\xampp\apache\logs
$files = Get-ChildItem C:\xampp\apache\logs\*.log
$files | Select-String 'error'