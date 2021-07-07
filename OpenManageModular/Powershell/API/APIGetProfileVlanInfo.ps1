#########################################################################################################
#This script will pull associated vlan information.
#Must run APIGetAuth.ps1 first
#File is csv with the following headers:  servicetag
#Service tags must be in all CAPS
#Output is where the created csv file will be saved.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"

#File containing vlan information
$file=Import-csv c:\scripts\servicetags.csv

#Output file
$output= "c:\scripts\vlaninfo.csv"

$data=foreach($st in $file.servicetag){
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/NetworkService/ServerProfiles('$st')/ServerInterfaceProfiles" -Method 'GET' -Headers $headers -Body $body
$nic=($response.content | convertfrom-json).value.id
foreach ($n in $nic){
$response2 = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/NetworkService/ServerProfiles('$st')/ServerInterfaceProfiles('$n')" -Method 'GET' -Headers $headers -Body $body
($response2.content | convertfrom-json).networks |select-object @{Name="ServiceTag"; Expression={$st}}, @{Name="NetworkInterface"; Expression={$n}},ID, Name, VlanMaximum, VlanMinimum
}
}
$data| Export-Csv -IncludeTypeInformation -Path $output