#########################################################################################################
#This script will install several licenses on OMIVV
#Username and password is to login to the share hosting the license files
#MUST have bearer token prior to running this script
#Path will follow this standard "\\\\hostname\\folder\\folder\\"
#Licenses will follow this standard "\\hostname\folder\folder\"
#Licenses is where the license files have been extracted to
#########################################################################################################

#IP address or FQDN of the OMIVV instance
$omivv = "omivvfqdnip"

#Share Info
$type = "CIFS"
$path = "\\\\hostnameip\\folder\\folder\\"
$licenses = "\\hostnameip\folder\folder\"

#Share Creds
$username = "user"
$password = "password"
$domain = "domain"

foreach($l in (Get-ChildItem -Path $licenses).name){
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $bearertoken")
$headers.Add("Content-Type", "application/json")

$body = "{
`n`"sharetype`": `"$type`",
`n`"path`": `"$path$l`",
`n`"credential`": {
`n    `"username`": `"$username`",
`n    `"domain`": `"$domain`",
`n    `"password`": `"$password`"
`n    }
`n}
`n"
Write-Host "Processing $l"
$response = Invoke-webrequest -SkipCertificateCheck "https://$omivv/Spectre/api/rest/v1/Services/LicenseService/Licenses" -Method 'POST' -Headers $headers -Body $body
$response.StatusDescription
}