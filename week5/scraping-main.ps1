. (Join-Path $PSScriptRoot "ScrapingChamplainClasses.ps1")

$FullTable = gatherClasses
daysTranslator($FullTable)


# List all the classes of the instructor furkan paligu 
$i = $FullTable | Select-Object "ClassCode", "Instructor", "Location", "Days", "Time Start", "Time End" `
     | Where-Object { $_."Instructor" -ilike "Furkan Paligu" }

$i

# List all the classes of JOYC 310 on Mondays, only display Class Code and Times. Sort by Start Time
$ii = $FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday" ) }
$ii = $ii | Sort-Object "Time Start" | Select-Object "Time Start", "Time End", "ClassCode"

# Make a list for all the instructors that teach at least 1 course in one of the courses:
# SYS, NET, SEC, FOR, CSI, DAT. Sort by name and make it unique
$ITSInstructors = $FullTable | Where-Object { ($_."ClassCode" -ilike "SYS*") -or `
                                              ($_."ClassCode" -ilike "NET*") -or `
                                              ($_."ClassCode" -ilike "SEC*") -or `
                                              ($_."ClassCode" -ilike "FOR*") -or `
                                              ($_."ClassCode" -ilike "CSI*") -or `
                                              ($_."ClassCode" -ilike "DAT*") } `
                             | Select-Object "Instructor" `
                             | Sort-Object "Instructor" -Unique

#$ITSInstructors




$iv = $FullTable | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } `
                 | Group-Object -Property "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending

#$iv