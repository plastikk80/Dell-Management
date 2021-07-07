#########################################################################################################
#This script will email a report to email address listed in the format listed.
#Must run APIGetAuth.ps1 first
#Set IP address for OME\OME-M instance.
#Report format options html,csv,pdf,xls
#Multiple emails can be used but must be comma separated
#########################################################################################################

#IP address of OME
$ip = "10.0.0.1"

#Email addresses
$emails = "bob@email.com"

#Report ID
$report = "42929"

#Report format
$format = "csv"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)
$headers.Add("Content-Type", "application/json")

$body = "{
`n`"ReportDefId`":$report,
`n`"Format`":`"$format`",
`n`"EmailIds`":`"$emails`"
`n}"

Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/ReportService/Actions/ReportService.EmailReport" -Method 'POST' -Headers $headers -Body $body