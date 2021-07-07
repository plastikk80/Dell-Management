#########################################################################################################
#This script will install certificates produced by a CA from the certificate request files.
#CSV must have the following headers:  Hostname IPaddress
#File is where the CSV file is located.
#Certificate must be named the ip address of the iDRAC.
#Certificate file extension must be .crt
#Cert is the location of the crt file.
#Cert filename should follow this standard ipaddressofidrac.crt
#########################################################################################################

#iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

#File containing a list of iDRACs
$file = Import-csv c:\scripts\idracs.csv

#Directory of certificate request download
$cert = "C:\certificate\"

foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p sslcertupload -t 4 -f ($cert+$idrac+".crt")
racadm -r $idrac $warn -u $u -p $p racreset
}