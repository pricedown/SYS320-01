clear
$scraped_page = Invoke-WebRequest -TimeoutSec 5 http://localhost/ToBeScraped.html
#$scraped_page.Links | Select-Object @{N="URL";E={$_.href}}, @{N="Text";E={$_.outerText}}
$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select outerText
$h2s
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { 
$_.getAttributeNode("class").Value -ilike "div-1" } | select innerText
$divs1