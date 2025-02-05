clear

cd C:\xampp\apache\logs
Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch