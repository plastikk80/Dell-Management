#########################################################################################################
#This script will get an API authentication token and set it to a variable.
#Set username and password for logging into OME\OME-M.
#Set IP address for OME\OME-M instance.
#########################################################################################################

$user = "username"
$password = "password"
$ip = "10.0.0.1"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$body = "{
`n `"UserName`":`"$user`",
`n `"Password`":`"$password`",
`n `"SessionType`":`"API`"
`n}
`n"

$global:apitoken = (Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/SessionService/Sessions" -Method 'POST' -Headers $headers -Body $body).headers.'X-Auth-Token'
$apitoken