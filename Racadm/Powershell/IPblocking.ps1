#########################################################################################################
#This script will enable\disable IP blocking from invaild passwords.
#CSV must have at least the following headers: hostname,ipaddress
#File is where the CSV file is located.
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Enable or Disable IP blocking (1=Enable, 0=Disable)
$block = "1"

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"


foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p set idrac.ipblocking.blockenable $block
}