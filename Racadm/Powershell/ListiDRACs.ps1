#This script with gather the IP address and DNS name for all iDRACs within the specified range.
#Network information
$Network = "192.168.3.0" -replace "0$",$ip
#If your iDRACs are on a subset of the network you can specify a range here.
$range = 1..254

#iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

#File containing a list of iDRACs
$file = "c:\scripts\idrac.csv"

#Building array for information
$iDRACArray = @()

Foreach($i in $range){
Write-Host "Attempting to connect to $($network+$i)"
$Result = "" | Select Hostname,IPAddress
$Result.Hostname = (racadm -r ($network+$i) $warn -u $u -p $p get idrac.nic.dnsracname|select-string -Pattern "DNSRacName=").tostring().trim("DNSRacName=")
$Result.IPAddress = (racadm -r ($network+$i) $warn -u $u -p $p get idrac.ipv4.address|select-string -Pattern "Address=").tostring().trim("Address=")
$iDRACArray += $Result
}

$iDRACArray | export-csv $file -NoTypeInformation