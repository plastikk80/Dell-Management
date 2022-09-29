#########################################################################################################
#This script will rename the downloaded license files to servicetag.xml.
#Path is where the files are located.
#This creates a structure to be consumed by the InstallLicenses.ps1
#This will rename ALL files in the specified directory.
#########################################################################################################

#Location of files to be renamed
$Path = "C:\temp\test"

$files = Get-ChildItem $path *.xml

foreach ($file in $files) {
    Get-ChildItem -path $file | Rename-Item -NewName {[string]($_.name).substring(0,7)+".xml"}
}
