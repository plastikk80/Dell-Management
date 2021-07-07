#########################################################################################################
#This script will filter down certain attributes from the hwinventory
#CSV must have at least the following headers: hostname,ipaddress
#File is where the CSV file is located.
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Location of log file
$path = "C:\OutPut\log.txt"

#Current iDRAC login information
$u="username"
$p="password"
$warn = "--nocertwarn"
Start-Transcript -Path $path -NoClobber
foreach($idrac in $file.ipaddress){
$hostname = racadm -r $idrac $warn -u $u -p $p getsysinfo | Select-String "DNS RAC Name            ="
$svctag = racadm -r $idrac $warn -u $u -p $p getsysinfo | Select-String "SVC Tag                 ="
Write-Host $hostname
Write-Host $svctag
racadm -r $idrac $warn -u $u -p $p hwinventory | Select-String "Device Type = PowerSupply" -Context 1,23
}
Stop-Transcript