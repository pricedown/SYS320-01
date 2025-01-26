clear

cd $PSScriptRoot

$task8 = Get-ChildItem | Where-Object { $_.Name -ilike "*ps1" }

 
$folderPath = "$PSScriptRoot\outfolder"
if (Test-Path $folderPath) {
    $task9 = Write-Host "Folder already exists"
} else {
    $task9 = New-Item -Path $folderPath -ItemType "directory"
}

$task10 = Get-ChildItem | Where-Object { $_.Name -ilike "*.ps1" }
$task10 | Export-Csv -Path $folderPath\hidden-result.csv

$folderPath = "$PSScriptRoot\outfolder"
$csvFiles = Get-ChildItem -Path $folderPath | Where-Object { $_.Name -ilike "*.csv" }
$csvFiles | Rename-Item -NewName $_.Replace(".csv", ".log")
$task11 = Get-ChildItem | Where-Object { $_.Name -ilike "*.log" }