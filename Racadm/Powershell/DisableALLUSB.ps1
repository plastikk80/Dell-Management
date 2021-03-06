#########################################################################################################
#This script will disable front USB ports on the device.
#CSV must have at least the following headers: hostname,ipaddress
#File is where the CSV file is located.
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Current iDRAC login information
$u="root"
$p="calvin1"
$warn = "--nocertwarn"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p set BIOS.IntegratedDevices.UsbPorts AllOff
}