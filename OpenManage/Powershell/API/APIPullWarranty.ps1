#########################################################################################################
#This script will pull the warranty information from OpenManage Enterprise.
#Must run APIGetAuth.ps1 first.
#File is where the file stored.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"

#Filepath for warranty information
$filepath = "C:\OutPut\WarrantyInfo.txt"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("x-auth-token", $apitoken)

$response = Invoke-WebRequest -skipcertificatecheck "https://$ip/api/WarrantyService/Warranties" -Method 'GET' -Headers $headers -Body $body
(($response).content |ConvertFrom-Json).value |Out-File -FilePath $filepath