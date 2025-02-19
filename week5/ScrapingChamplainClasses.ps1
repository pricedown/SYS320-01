clear

function gatherClasses() {
    $page = Invoke-WebRequest -TimeoutSec 2 http://localhost/Courses.html
    $trs = $page.ParsedHTML.body.getElementsByTagName("tr")

    $FullTable = @()
    for ($i=1; $i -lt $trs.length; $i++) {
        $tds = $trs[$i].getElementsByTagName("td")
        $Times = $tds[5].innerText.Split("-")

      
        #for ($n=0; $n -lt $tds.length; $n++) { "$n : $($tds[$n].innerText | Out-String)" | Out-String }
        
        
        $FullTable += [pscustomobject]@{ "ClassCode" = $tds[0].innerText; `
                                         "Title" = $tds[1].innerText; `
                                         "Days" = $tds[4].innerText; `
                                         "Time Start" = $Times[0]; `
                                         "Time End" = $Times[1]; `
                                         "Instructor" = $tds[6].innerText; `
                                         "Location" = $tds[9].innerText; `
        } #>
    }
    return $FullTable
}

function daysTranslator($FullTable) {
    for ($i=1; $i -lt $FullTable.length; $i++) {
        $Days = @()

        $old = $FullTable[$i].Days;

        if ($old -ilike "*M*") { $Days += "Monday" }

        if ($old -ilike "*T[TWF]*") { $Days += "Tuesday" }
        elseif ($old -ilike "T") { $Days += "Tuesday" }

        if ($old -ilike "*W*") { $Days += "Wenesday" }
        if ($old -ilike "*TH*") { $Days += "Thursday" }
        if ($old -ilike "*F*") { $Days += "Friday" }

        $FullTable[$i].Days = $Days 
    }
}
