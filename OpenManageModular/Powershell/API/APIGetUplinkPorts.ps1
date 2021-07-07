#########################################################################################################
#This script will pull specific uplink information for scripting.
#Must run APIGetAuth.ps1 first.
#Outputs vlan information on screen.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.2"

#ID of fabric
$id = "f2c664f8-b8ee-4e73-8ecf"

#ID of uplink
$ul = "9f17120a-4f44-473d-81fa"




$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$body = ""

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/NetworkService/Fabrics('$id')/Uplinks('$ul')/Ports" -Method 'GET' -Headers $headers -Body $body
($response.content | ConvertFrom-Json).value | select-object NodeServiceTag, PortNumber