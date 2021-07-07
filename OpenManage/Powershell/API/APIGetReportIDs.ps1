#########################################################################################################
#This script will get a list of all reports in OME with IDs.
#Must run APIGetAuth.ps1 first
#Set IP address for OME\OME-M instance.
#########################################################################################################

#IP address of OME
$ip = "10.0.0.1"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$response = Invoke-RestMethod -skipcertificatecheck -FollowRelLink "https://$ip/api/ReportService/ReportDefs?top=1000000000"  -Method 'GET' -Headers $headers -Body $body
$info = ($response).value | select-object Name, ID
$info
