#########################################################################################################
#This script will enable SNMP alerts, point SNMP to OMEnt\OMEss instance and switch SNMP to v2.
#This will REPLACE the destination in alert destination 5.
#CSV must have at least the following headers: hostname,ipaddress
#File is where the CSV file is located.
#OME is your OMEnt\OMEss instance IP address.
#SNMP is your community name.
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

#OME IP address
$OME="192.168.2.25"

#Community name
$SNMP = "public"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p set iDRAC.SNMP.Trapformat 1
racadm -r $idrac $warn -u $u -p $p set iDRAC.IPMILan.CommunityName $SNMP
racadm -r $idrac $warn -u $u -p $p set iDRAC.IPMILan.AlertEnable 1
racadm -r $idrac $warn -u $u -p $p set iDRAC.SNMPAlert.5.Destination $OME
racadm -r $idrac $warn -u $u -p $p set iDRAC.SNMPAlert.5 Enable
}
