#########################################################################################################
#This script will reset a list of iDRACs.
#CSV must have at least the following headers: ipaddress
#File is where the CSV file is located.
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p racreset
}