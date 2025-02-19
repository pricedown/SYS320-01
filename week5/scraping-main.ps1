. (Join-Path $PSScriptRoot "ScrapingChamplainClasses.ps1")

$FullTable = gatherClasses
daysTranslator($FullTable)


# List all the classes of the instructor furkan paligu
$i = $FullTable | 

# List all the classes of JOYC 310 on Mondays, only display Class Code and Times. Sort by Start Time
$ii = $FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday" ) }
$ii = _______ "Time Start" | `
      _______ "Time Start", "Time End", "Class Code"
$ii

# Make a list for all the instructors that teach at least 1 course in one of the courses:
# SYS, NET, SEC, FOR, CSI, DAT. Sort by name and make it unique
$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                                              ($_."Class Code" -ilike "NET*") -or `
                                              ($_."Class Code" -ilike "SEC*") -or `
                                              ($_."Class Code" -ilike "FOR*") -or `
                                              ($_."Class Code" -ilike "CSI*") -or `
                                              ($_."Class Code" -ilike "DAT*") -or }
                             | _____ "Instructor" `
                             | _____ "Instructor" -____

$ITSInstructors

$iv = FullTable | ____ { $_.Instructor -in $ITSInstructors.Instructor }
                 | ________ "Instructor" | ______ Count,Name | ______ Count -Descending


