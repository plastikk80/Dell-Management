#########################################################################################################
#This script will set iDRAC location information.
#CSV must have at least the following headers: ipaddress, datacenter, aislename, rackname, serveru, leaseenddate, leaselessor, idracname
#File is where the CSV file is located.
#All double quotes must remain intact and fill out the following inputs.
#$DC=DatacenterName <String>
#$AN=AisleName <String>
#$RN=RackName <String>
#$RU=ServerU <1-255>
#$LED=LeaseEndDate <String> <xx/xx/xxxx>
#$LL=LeaseLessor <String>
#$IDN=iDRACName <String>
#########################################################################################################

#File containing iDRAC information
$file=Import-csv c:\scripts\locationinformation.csv

#iDRAC Location Information
$DC="$($file.datacenter)"
$AN="$($file.aislename)"
$RN="$($file.rackname)"
$RU="$($file.serveru)"

#iDRAC Lease Information
$LED = "$($file.leaseenddate)"
$LL= "$($file.leaselessor)"

#iDRAC Name Information
$IDN = "$($file.idracname)"

#iDRAC Info
$u="root"
$p="calvin"
$warn = "--nocertwarn"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p set system.servertopology.datacentername $DC
racadm -r $idrac $warn -u $u -p $p set system.servertopology.aislename $AN
racadm -r $idrac $warn -u $u -p $p set system.servertopology.rackname $RN
racadm -r $idrac $warn -u $u -p $p set system.servertopology.rackslot $RU
racadm -r $idrac $warn -u $u -p $p set system.leaseinfo.enddate $LED
racadm -r $idrac $warn -u $u -p $p set system.leaseinfo.lessor $LL
racadm -r $idrac $warn -u $u -p $p set idrac.nic.dnsracname $IDN
}