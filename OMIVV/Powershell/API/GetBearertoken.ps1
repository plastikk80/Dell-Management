#########################################################################################################
#This script will create a bearer token for OMIVV
#Username and password is to login to the OMIVV administrative console
#Bearer token will be output to screen and saved as a variable
#########################################################################################################

#IP address or FQDN of the OMIVV instance
$omivv = "omivvfqdnip"

#Creds
$username = "user"
$password = "password"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$body = "{
`n`"apiUserCredential`": {
`n`"username`": `"$username`",
`n`"domain`": `"`",
`n`"password`": `"$password`"}
`n}"

$response = Invoke-webrequest -SkipCertificateCheck "https://$omivv/Spectre/api/rest/v1/Services/AuthenticationService/login" -Method 'POST' -Headers $headers -Body $body
$global:bearertoken = ($response.content | Convertfrom-Json).accesstoken
$bearertoken