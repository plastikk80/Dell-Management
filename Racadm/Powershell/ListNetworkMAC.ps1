#########################################################################################################
#This script will gather all network switch mac addresses for a given FX or M1000E system.
#This script is built to be run on a single system with 6 switches.
#########################################################################################################

#Current iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

#System IP address
$ip="192.168.7.1"

#Build Array
$macs = @()

foreach($s in 1..6){
$text=racadm -r $ip $warn -u $u -p $p getmacaddress -m switch-$s
$text= -split $text
$text1= $text|Select-String -Pattern ":"
$macs+=($text1|Select-Object).line
}
$macs