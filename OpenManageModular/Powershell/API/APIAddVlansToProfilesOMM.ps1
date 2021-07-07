#########################################################################################################
#This script will add vlans to server profiles on OpenManage Modular.
#Must run APIGetAuth.ps1 first.
#CSV must have at least the following headers: DeviceName, Model, DeviceServiceTag, Id, Fqdd
#vlanid is NOT your vlan number.  You'll need to get the identifier for that network.
#File is where the CSV file is located.
#########################################################################################################

#IP address of the OME\OME-M instance
$ip = "10.0.0.1"

#File containing vlan information
$file=Import-csv "C:\OutPut\STNIC.csv"

foreach($profile in $file){
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-Token", $apitoken)
$headers.Add("Content-Type", "application/json")

$body = "{
    `n `"ServersServiceTag`":[`"$($profile.deviceservicetag)`"],
    `n `"ServerProfile`":{
    `n `"ServerInterfaceProfiles`":[
    `n {
    `n `"Id`":`"$($profile.fqdd)`",
    `n `"Networks`":[
    `n {`"Id`":$($profile.id)}
    `n ]
    `n }
    `n ]
    `n }
    `n}
    `n"

$global:response = Invoke-webrequest -SkipCertificateCheck "https://$ip/api/NetworkService/Actions/NetworkService.AddServerNetworks" -Method 'POST' -Headers $headers -Body $body
}