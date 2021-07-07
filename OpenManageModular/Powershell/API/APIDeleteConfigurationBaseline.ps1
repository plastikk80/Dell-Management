#########################################################################################################
#This script will pull delete a configuration baseline based upon ID
#Must run APIGetAuth.ps1 first
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"

#ID of F/W baseline for removal
$id = "6"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)
$headers.Add("Content-Type", "application/json")

$body = "{
`n`"BaselineIds`":[$id]
`n}"

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/TemplateService/Actions/TemplateService.RemoveBaseline" -Method 'POST' -Headers $headers -Body $body
($response.content | ConvertFrom-Json).value