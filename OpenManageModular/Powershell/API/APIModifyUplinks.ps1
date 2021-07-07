#########################################################################################################
#This script will change uplinks.
#This will replace any setting currently on your uplinks.
#Must run APIGetAuth.ps1 first.
#Outputs vlan information on screen.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.2"

#ID of fabric
$id = "f2c664f8-b8ee-4e73-8ecf"

#ID of uplink
$ul = "9f17120a-4f44-473d-81fa"

#Name of uplink
$name = "name"

#Description of uplink
$desc = "desc"

#Media type of uplink
$mt = "media"

#Switch service tag and port information
#First port
$port1 = "st:port"
#Second port
$port2 = "st:port"

#network
$network = "network"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)
$headers.Add("Content-Type", "application/json")

$body = "{
`n `"Id`": `"$($ul)`",
`n `"Name`": `"$($name)`",
`n `"Description`": `"$($desc)`",
`n `"MediaType`": `"$($mt)`",
`n  `"Ports`": [
`n {
`n `"Id`": `"$($port1)`"
`n },
`n {
`n `"Id`": `"$($port2)`"
`n }
`n],
`n `"Networks`": [
`n {
`n `"Id`": $network
`n }
`n ]
`n}
`n"

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/NetworkService/Fabrics('$id')/Uplinks('$ul')" -Method 'PUT' -Headers $headers -Body $body
$response