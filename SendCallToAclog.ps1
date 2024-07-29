Param (
    [string]$callSign
)
Write-Host "SendCallToAclog '$callSign'"
 .\SendStringByUdp.ps1 -EndPoint "127.0.0.1" -Port 2241 -Message "<CMD><UPDATE><CONTROL>TXTENTRYCALL</CONTROL><VALUE>$callSign</VALUE></CMD>
<CMD><ACTION><VALUE>CALLTAB</VALUE></CMD>
 "

