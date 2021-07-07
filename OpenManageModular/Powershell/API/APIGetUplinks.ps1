#########################################################################################################
#This script will pull uplink names and ids for scripting.
#Must run APIGetAuth.ps1 first.
#Outputs vlan information on screen.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.2"

#ID of fabric
$id = "f2c664f8-b8ee-4e73-8ecf"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$body = ""

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/NetworkService/Fabrics('$id')/Uplinks" -Method 'GET' -Headers $headers -Body $body
($response.content | ConvertFrom-Json).value | select-object Name, Id