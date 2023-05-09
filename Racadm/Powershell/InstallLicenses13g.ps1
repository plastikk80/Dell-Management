#########################################################################################################
#This script will install licenses on multiple iDRACs. (13th gen only!!!!)
#CSV must have at least the following headers: ipaddress,location
#File is where the CSV file is located.
#License file name must match service tag (ex. xrg457h.xml).
#Location is where the license files are located
#Location must end in a \
##########################################################################################################

#File containing iDRAC and license information
$file=Import-csv c:\scripts\iDRACs.csv

#iDRAC login information
$u="root"
$p="calvin"
$warn="--nocertwarn"



foreach($idrac in $file){
    $st= (racadm -r $idrac.ipaddress --nocertwarn -u $u -p $p get bios.sysinformation.systemservicetag |select-string -Pattern "systemservicetag=").tostring().trim("systemservicetag=")
    racadm -r $idrac.ipaddress $warn -u $u -p $p license import -f $($idrac.location+$st +".xml") -c iDRAC.Embedded.1
    }