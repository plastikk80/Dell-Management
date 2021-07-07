#########################################################################################################
#This script will get Name, Model, Service Tag and Id from OpenManage Modular.
#Must run APIGetAuth.ps1 first.
##File is where the CSV file will be located.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"

#File containing a list of iDRACs
$file = "c:\output\servicetags.csv"



$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", "$apitoken")

$body = ""

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/DeviceService/Devices" -Method 'GET' -Headers $headers -Body $body

$output = ($response.content | ConvertFrom-Json).value | select-object DeviceName, Model, DeviceServiceTag, Id
$output | export-csv -Path $file -NoTypeInformation