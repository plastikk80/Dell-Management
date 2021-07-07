#########################################################################################################
#This script will create local users on the iDRAC.
#CSV must have at least the following headers: ipaddress
#File is where the CSV file is located.
#The first MAC listed is always the iDRAC of the system.
#########################################################################################################
#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

$data = foreach($idrac in $file){
$mac = racadm -r $idrac.ipaddress $warn -u $u -p $p racdump |select-string "\w\w:\w\w:\w\w:\w\w:\w\w:\w\w" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }
foreach($m in $mac){
    $idrac.ipaddress |select-object @{Name="IP"; expression={$idrac.ipaddress}}, @{Name="Mac Addresses"; expression={$m}}
}
}
$data