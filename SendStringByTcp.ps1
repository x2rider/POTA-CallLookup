Param (
    [string]$EndPoint,
    [int]$Port,
    [string]$Message
)

$IP = [System.Net.Dns]::GetHostAddresses($EndPoint)
$Address = [System.Net.IPAddress]::Parse($IP)
$Socket = New-Object System.Net.Sockets.TcpClient($Address, $Port)
$tcpStream = $Socket.GetStream()
$writer = New-Object System.IO.StreamWriter($tcpStream)
$writer.AutoFlush = $true
$writer.WriteLine($Message) | Out-Null
#Write-Host "Message Sent: '$Message'"

$writer.Close()
$Socket.Close()