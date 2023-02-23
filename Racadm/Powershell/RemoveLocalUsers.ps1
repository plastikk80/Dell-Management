#########################################################################################################
#This script will remove and disable specific users on the iDRAC.
#CSV must have at least the following headers: ipaddress,index
#File is where the CSV file is located.
#########################################################################################################
#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACIndex.csv

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

foreach($idrac in $file){
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.Users.Enable.$($idrac.index) 0
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.Users.UserName.$($idrac.index) ""
}