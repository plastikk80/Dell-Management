#########################################################################################################
#This script will create vlans
#CSV must have at least the following headers: name, description, vlanmax, vlanmin, type
#Vlanmax and vlanmin will match for a single vlan.
#Type will either be Ethernet or FCoE
#File is where the CSV file is located.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.4"

#File containing vlan information
$file=Import-csv c:\scripts\vlans.csv



foreach($vlan in $file){
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("x-auth-token", $apitoken )
$headers.Add("Content-Type", "application/json")

$body = "{
`n `"Name`": `"$($vlan.name)`",
`n `"Description`": `"$($vlan.description)`",
`n `"VlanMaximum`": $($vlan.vlanmax),
`n `"VlanMinimum`": $($vlan.vlanmin),
`n `"Type`": $($vlan.type)
`n}"

$response = Invoke-webrequest -SkipCertificateCheck "https://$ip/api/NetworkConfigurationService/Networks" -Method 'POST' -Headers $headers -Body $body
}