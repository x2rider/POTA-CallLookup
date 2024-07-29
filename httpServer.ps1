$listener = New-Object System.Net.HttpListener
$url = "http://localhost:8075/"
$listener.Prefixes.Add($url)
$listener.Start()
$lastCall = ""

Write-Host "$(Get-Date) Listening on $url"

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $queryString = $request.QueryString
        $callSign = $queryString["callsign"]
        if ($callSign -ne $lastCall)  {
            $method = $queryString["method"]
            Write-Host "Looking up callsign '$callSign' using '$method'"
            $lastCall = $callSign
            switch ($method.ToLower()) {
                "log4om" {
                    ./SendCallToLog4OM.ps1 $callSign
                   }
                "aclog"{
                    ./SendCallToAclog.ps1 $callSign
                   }
                Default { Write-Host "Unknown method.  Options are: log4om or aclog"}
            }
        }
    }
}
finally {
    Write-Host "$(Get-Date) Stopping"
    $listener.Stop() 
}
