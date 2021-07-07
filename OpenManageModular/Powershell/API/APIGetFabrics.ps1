#########################################################################################################
#This script will pull fabric names and ids for scripting.
#Must run APIGetAuth.ps1 first.
#Outputs vlan information on screen.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.2"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$body = ""

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/NetworkService/Fabrics" -Method 'GET' -Headers $headers -Body $body
($response.content | ConvertFrom-Json).value | select-object Name, Id