#########################################################################################################
#This script will create local users on the iDRAC.
#CSV must have at least the following headers: ipaddress,index,username,password,enable,privilege
#File is where the CSV file is located.
#########################################################################################################
#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACUsers.csv

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

foreach($idrac in $file){
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.Users.UserName.$($idrac.index) $idrac.username
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.Users.Password.$($idrac.index) $idrac.password
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.Users.Privilege.$($idrac.index) $idrac.privilege
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.Users.Enable.$($idrac.index) $idrac.enable
}