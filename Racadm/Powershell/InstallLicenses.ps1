#########################################################################################################
#This script will install licenses on multiple iDRACs.
#CSV must have at least the following headers: ipaddress,location
#File is where the CSV file is located.
#License file name must match service tag.
#Location must end in a \
#########################################################################################################

#File containing iDRAC and license information
$file=Import-csv c:\scripts\iDRACs.csv

#iDRAC login information
$u="root"
$p="calvin"
$warn="--nocertwarn"



foreach($idrac in $file){
    $st= (racadm -r $idrac.ipaddress --nocertwarn -u $u -p $p get system.serverinfo.servicetag |select-string -Pattern "ServiceTag=").tostring().trim("ServiceTag=")
    racadm -r $idrac.ipaddress $warn -u $u -p $p license import -f $($idrac.location+$st +".xml") -c iDRAC.Embedded.1
    }
