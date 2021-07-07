#########################################################################################################
#This script will perform a racdump from CMCs.
#CSV must have at least the following headers: ipaddress
#File is where the CMCs csv is located
#Directory is where the racdumps will be saved
#Do not change the file name for racdump
#########################################################################################################

#File containing CMC information
$file=Import-csv c:\scripts\cmcs.csv

#iDRAC Info
$u="root"
$p="calvin"
$warn = "--nocertwarn"

#Directory to save file
$directory="C:\OutPut\$($cmc).log"

foreach($cmc in $file.ipaddress){
write-host "Working on $cmc"
$output = racadm -r $cmc $warn -u $u -p $p racdump
$output | Out-file -filepath $directory
}