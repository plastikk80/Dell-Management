#########################################################################################################
#This script will logoff of OMIVV
#Username and password is to login to the OMIVV administrative console
#Bearer token will be output to screen and saved as a variable
#########################################################################################################

#IP address or FQDN of the OMIVV instance
$omivv = "omivv-tr-0.ose.adc.delllabs.net"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $bearertoken")

$body = ""

Invoke-webrequest -SkipCertificateCheck "https://$omivv/Spectre/api/rest/v1/Services/AuthenticationService/logoff" -Method 'POST' -Headers $headers -Body $body
($response).StatusDescription