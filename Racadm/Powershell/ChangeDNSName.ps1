#########################################################################################################
#This script will change the DNS name of iDRACs in a csv file.
#CSV must have at least the following headers: ipaddress,name
#File is where the CSV file is located.
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p set idrac.nic.dnsracname $file.name
}

