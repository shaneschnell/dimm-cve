#================================================================================================
# Variables
#================================================================================================
$reportName = "IntersightDIMMs"
$date 		= Get-Date -Format "yyyy-MM-dd_hh-mm"
$csvFile 	= "$env:userprofile\$ReportName.$date.csv"


#================================================================================================
# Install/Import Internsight PowerShell Module
#================================================================================================
# https://github.com/CiscoDevNet/intersight-powershell#1-installation
Install-Module -Name Intersight.PowerShell
Import-Module -Name Intersight.PowerShell


#================================================================================================
# Setup Auth
#================================================================================================
# https://github.com/CiscoDevNet/intersight-powershell#authenticate-the-user
$onprem = @{
    BasePath = "https://intersight.com"
    ApiKeyId = "xxxxx27564612d30dxxxxx/5f21c9d97564612d30dd575a/5f9a8b877564612xxxxxxxx"
    ApiKeyFilePath = "C:\SecretKey.txt"
    HttpSigningHeader =  @("(request-target)", "Host", "Date", "Digest")
}

Set-IntersightConfiguration @onprem


#================================================================================================
# Collect Memory DIMM Info
#================================================================================================
Get-IntersightMemoryUnit | Where-Object {$_.Presence -ne "missing"} | Select-Object Model, Serial, Dn, Location | Sort-Object Dn | Export-Csv $CsvFile -NoTypeInformation
