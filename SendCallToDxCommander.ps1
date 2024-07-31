Param (
    [string]$callSign
)
# placeholder for DX Commander until it can be finished
Write-Host "SendCallToDXCommander '$callSign'"
 .\SendStringByTcp.ps1 -EndPoint "127.0.0.1" -Port 2241 -Message ""

