#########################################################################################################
#This script will collect and export TSRs.
#There is a 5 minute wait between collecting and exporting.
#CSV must have at least the following headers: ipaddress
#File is where the idrac csv is located
#Directory is where the TSRs will be saved
#Do not change the file name for TSR
#########################################################################################################


#File containing iDRAC information
$file=Import-csv c:\scripts\idracs.csv

#iDRAC Info
$u="root"
$p="calvin"
$warn = "--nocertwarn"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p techsupreport collect -t sysinfo
}

#Wait for collects to complete
Start-sleep -s 600

foreach($idrac in $file.ipaddress){

#Directory to save file
$directory="C:\OutPut\$($idrac).zip"

racadm -r $idrac $warn -u $u -p $p techsupreport export -f $directory
}
