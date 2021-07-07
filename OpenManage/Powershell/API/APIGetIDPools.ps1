#########################################################################################################
#This script will pull all id pools
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.2"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$body = ""

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/IdentityPoolService/IdentityPools" -Method 'GET' -Headers $headers -Body $body
($response.content | ConvertFrom-Json).value | Select-Object Name, id