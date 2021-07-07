#########################################################################################################
#This script will pull all configuration baseline names and IDs.
#Must run APIGetAuth.ps1 first
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$body = ""

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/TemplateService/Baselines" -Method 'GET' -Headers $headers -Body $body
($response.content | ConvertFrom-Json).value | select-object Name, Id