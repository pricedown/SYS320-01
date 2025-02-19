. (Join-Path $PSScriptRoot "ScrapingChamplainClasses.ps1")

$FullTable = gatherClasses
daysTranslator($FullTable)


# List all the classes of the instructor furkan paligu 
$i = $FullTable | Select-Object "Class Code", "Instructor", "Location", "Days", "Time Start", "Time End" `
     | Where-Object { $_."Instructor" -ilike "Furkan Paligu" }
$i


# List all the classes of JOYC 310 on Mondays, only display Class Code and Times. Sort by Start Time
$ii = $FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday" ) }
$ii = $ii = $ii | Sort-Object "Time Start" | Select-Object "Time Start", "Time End", "Class Code"

# Make a list for all the instructors that teach at least 1 course in one of the courses:
# SYS, NET, SEC, FOR, CSI, DAT. Sort by name and make it unique
$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                                              ($_."Class Code" -ilike "NET*") -or `
                                              ($_."Class Code" -ilike "SEC*") -or `
                                              ($_."Class Code" -ilike "FOR*") -or `
                                              ($_."Class Code" -ilike "CSI*") -or `
                                              ($_."Class Code" -ilike "DAT*") } `
                             | Select-Object -Unique "Instructor" `
                             | Sort-Object "Instructor"

$ITSInstructors


$iv = $FullTable | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } `
                 | Group-Object -Property "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending
