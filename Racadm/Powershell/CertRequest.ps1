#########################################################################################################
#This script will set all needed information to generate a certificate request from a csv list of idracs.
#CSV must have the following headers:  Hostname IPaddress
#File is where the CSV file is located.
#All double quotes must remain intact and fill out the following inputs. DO NOT MODIFY CommonName.
#Cert is the location where you want the CSR files output to.
#$CommonName=<This will pull the hostname from the CSV>
#$CountryCode=US
#$EmailAddr=<email address of admin>
#$KeySize=<SSL Key size 1024 or 2048>
#$LocalityName=<City>
#$OrganizationName=<Company Name>
#$OrganizationUnit=<Department>
#$StateName=<State>
#$FIPSMode=Disabled
#########################################################################################################


#iDRAC login information
$u="root"
$p="calvin"
$warn = "--nocertwarn"

#File containing a list of iDRACs
$file = Import-csv c:\scripts\idracs.csv

#Directory of certificate request download
$cert = "C:\certificate\"

#Certificate Information
$CommonName="$($file.hostname)"
$CountryCode="US"
$EmailAddr="bob.smith@email.com"
$KeySize="2048"
$LocalityName="Round Rock"
$OrganizationName="Dell Inc"
$OrganizationUnit="Remote Access Group"
$StateName="Texas"


	
foreach($idrac in $file.ipaddress){
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrcommonname $CommonName
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrcountrycode $CountryCode
racadm -r $idrac $warn -u $u -p $p set idrac.security.csremailaddr $EmailAddr
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrkeysize $KeySize
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrlocalityname $LocalityName
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrorganizationname $OrganizationName
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrorganizationunit $OrganizationUnit
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrstatename $StateName
racadm -r $idrac $warn -u $u -p $p set idrac.security.csrsubjectaltname $CommonName
racadm -r $idrac $warn -u $u -p $p sslcsrgen -g -f ($cert + $idrac + ".csr")
}



