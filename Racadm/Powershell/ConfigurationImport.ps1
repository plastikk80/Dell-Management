#########################################################################################################
#This script will import a server configuration file.
#This script is set to not reboot the server. Some configuration elements require a reboot.
#CSV must have at least the following headers: ipaddress
#File is where the CSV file is located for the idrac ip information.
#Config is the name of the configuration file
#########################################################################################################
#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Filename containing iDRAC configuration information
$config="C:/Scripts/configuration.xml"

#Type of configuration file to be imported
$type="xml"

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

foreach($idrac in $file){
racadm -r $idrac.ipaddress $warn -u $u -p $p set -f $config -t $type -b `"NoReboot`"
}