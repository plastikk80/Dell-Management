#########################################################################################################
#This script will service tags and NIC information.
#Must run APIGetAuth.ps1 first.
#File is where the CSV file will be located containing the server information.
#File must contain the following headers; DeviceName, Model, DeviceServiceTag, Id
#Output is where the new CSV file will be created.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"

#File containing a list of DeviceName, Model, DeviceServiceTag, Id
$file = Import-csv -path "C:\OutPut\servicetags.csv" | where-object {($_.model -eq "PowerEdge MX740c" -or $_.model -eq "PowerEdge MX840c")}

#File to be created with output
$output = "c:\output\STNIC.csv"

$data = foreach($id in $file){
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)

$body = ""

$response = Invoke-Webrequest -SkipCertificateCheck "https://$ip/api/DeviceService/Devices($($id.id))/InventoryDetails('serverNetworkInterfaces')" -Method 'GET' -Headers $headers -Body $body
($response.content| ConvertFrom-Json).inventoryinfo.ports.partitions | select-object @{Name="DeviceName"; Expression={$id.Devicename}},@{Name="Model"; Expression={$id.Model}},@{Name="DeviceServiceTag"; Expression={$id.DeviceServiceTag}},@{Name="Id"; Expression={$id.id}}, fqdd

}
$data | Export-csv -NoTypeInformation -path $output