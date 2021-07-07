#########################################################################################################
#This script will authenicate with vCenter
#Username and password is to login to vCenter
#MUST have bearer token prior to running this script
#Console id is the id number of the vCenter you want to work in
#########################################################################################################

#IP address or FQDN of the OMIVV instance
$omivv = "omivvfqdnip"

#Creds
$username = "user"
$password = "password"
$domain = "domain"

#Console id
$id = "Consoleid"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $bearertoken")
$headers.Add("Content-Type", "application/json")

$body = "{
`n`"consoleId`": `"$id`",
`n`"consoleUserCredential`": {
`n    `"username`": `"$username`",
`n    `"domain`": `"$domain`",
`n    `"password`": `"$password`"
`n    }
`n}"

Invoke-webrequest -SkipCertificateCheck "https://$omivv/Spectre/api/rest/v1/Services/ConsoleService/OperationalContext" -Method 'POST' -Headers $headers -Body $body
