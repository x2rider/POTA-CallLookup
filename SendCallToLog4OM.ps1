Param (
    [string]$callSign
)
Write-Host "SendCallToLog4OM '$callSign'"
 .\SendStringByUdp.ps1 -EndPoint "127.0.0.1" -Port 2241 -Message "<RemoteControlRequest>
 <MessageId>C0FC027F-D09E-49F5-9CA6-33A11E05A053</MessageId>
 <RemoteControlMessage>SetCallsign</RemoteControlMessage>
 <Callsign>$callSign</Callsign>
 </RemoteControlRequest>
 "
