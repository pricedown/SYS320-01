clear

function getIOC() {
    $page = Invoke-WebRequest http://10.0.17.6/IOC.html -TimeoutSec 2

    
    $trElements = $page.ParsedHtml.body.getElementsByTagName("tr")

    $fullTable = @()
    for ($i = 0; $i -lt $trElements.Length; $i++) {
        $tdElements = $trElements[$i].getElementsByTagName("td")

        $fullTable += [pscustomobject]@{"Pattern" = $tdElements[0].innerText;`
                                        "Explanation" = $tdElements[1].innerText;`
        }
    }
    return $fullTable
}