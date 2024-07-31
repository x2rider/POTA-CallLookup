Param (
    [string]$callSign
)
# placeholder for DX Commander until it can be finished
Write-Host "SendCallToDXCommander '$callSign'"
 .\SendStringByUdp.ps1 -EndPoint "127.0.0.1" -Port 2241 -Message "<CMD><UPDATE><CONTROL>TXTENTRYCALL</CONTROL><VALUE>$callSign</VALUE></CMD>
<CMD><ACTION><VALUE>CALLTAB</VALUE></CMD>
 "

