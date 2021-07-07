#########################################################################################################
#This script will rename iDRAC root account and set the password as long as the account is still id 2.
#CSV must have at least the following headers: hostname,ipaddress
#File is where the CSV file is located.
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

#New username instead of root
$username="root1"

#New root password
$password="calvin"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p set idrac.users.2.username $username
racadm -r $idrac $warn -u $username -p $p set iDRAC.Users.2.Password $password
}