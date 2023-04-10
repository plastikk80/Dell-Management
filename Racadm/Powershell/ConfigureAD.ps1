#########################################################################################################
#This script will configure AD authentication on a list of iDRACs.
#This will only configure 1 domain and 1 user group with the specified privilege.
#CSV must have at least the following headers: ipaddress
#File is where the CSV file is located.
#########################################################################################################
#File containing iDRAC information
$file=Import-csv c:\scripts\iDRACs.csv

#Current iDRAC login information
$u="username"
$p="password"
$warn = "--nocertwarn"

#AD options
$AuthTimeout="120"
$CertValidationEnable="Disabled"
$DCLookupByUserDomain="Disabled"
$DCLookupDomainName="domain"
$DCLookupEnable="Enabled"
$DomainController1=
$DomainController2=
$DomainController3=
$Enable="Enabled"
$GCLookupEnable="Enabled"
$GCRootDomain="domain"
$GlobalCatalog1=
$GlobalCatalog2=
$GlobalCatalog3=
$RacDomain=
$RacName=
$Schema="2"
$SSOEnable="Disabled"
$UserDomain="domain"
$Domain="domain"
$Name="group"
$Privilege="0x1ff"


foreach($idrac in $file){
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.AuthTimeout $AuthTimeout
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.CertValidationEnable $CertValidationEnable
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.DCLookupByUserDomain $DCLookupByUserDomain
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.DCLookupDomainName $DCLookupDomainName
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.DCLookupEnable $DCLookupEnable
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.DomainController1 $DomainController1
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.DomainController2 $DomainController2
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.DomainController3 $DomainController3
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.Enable $Enable
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.GCLookupEnable $GCLookupEnable
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.GCRootDomain $GCRootDomain
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.GlobalCatalog1 $GlobalCatalog1
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.GlobalCatalog2 $GlobalCatalog2
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.GlobalCatalog3 $GlobalCatalog3
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.RacDomain $RacDomain
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.RacName $RacName
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.Schema $Schema
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ActiveDirectory.SSOEnable $SSOEnable
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.UserDomain.1.Name $UserDomain
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ADGroup.1.Domain $Domain
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ADGroup.1.Name $Name
racadm -r $idrac.ipaddress $warn -u $u -p $p set iDRAC.ADGroup.1.Privilege $Privilege

}