#########################################################################################################
#This script will pull vlan ids for scripting.
#Must run APIGetAuth.ps1 first.
#Outputs vlan information on screen.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)
$body = ""
$response = Invoke-webrequest -SkipCertificateCheck "https://$ip/api/NetworkConfigurationService/Networks" -Method 'GET' -Headers $headers -Body $body
$info = (($response).content |ConvertFrom-Json).value

$info | Select-Object name, id