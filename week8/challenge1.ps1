clear

function getIOC() {
    $contents = Invoke-WebRequest http://10.0.17.6/IOC.html -TimeoutSec 2
    $contents
}

getIOC