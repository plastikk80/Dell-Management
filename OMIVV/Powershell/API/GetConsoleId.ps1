#########################################################################################################
#This script will get the console ids for OMIVV
#MUST have bearer token prior to running this script
#########################################################################################################

#IP address or FQDN of the OMIVV instance
$omivv = "omivvfqdnip"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $bearertoken")

$body = ""

$response = Invoke-webrequest -SkipCertificateCheck "https://$omivv/Spectre/api/rest/v1/Services/ConsoleService/Consoles" -Method 'GET' -Headers $headers -Body $body
$response.content | ConvertFrom-Json