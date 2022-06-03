#================================================================================================
# Variables
#================================================================================================
$reportName = "IntersightDIMMs"
$date 		= Get-Date -Format "yyyy-MM-dd_hh-mm"
$csvFile 	= "$env:userprofile\Downloads\$ReportName.$date.csv"


#================================================================================================
# Import Intersight PowerShell Module
#================================================================================================
Import-Module -Name Intersight.PowerShell


#================================================================================================
# Setup Auth
#================================================================================================
# https://github.com/CiscoDevNet/intersight-powershell#authenticate-the-user
$onprem = @{
    BasePath = "https://intersight.com"
    ApiKeyId = $env:ApiKeyId
    ApiKeyFilePath = $env:ApiKeyFilePath
    HttpSigningHeader =  @("(request-target)", "Host", "Date", "Digest")
}

Set-IntersightConfiguration @onprem


#================================================================================================
# Collect Memory DIMM Info
#================================================================================================
Get-IntersightMemoryUnit | Where-Object {$_.Presence -ne "missing"} | Select-Object Model, Serial, Dn, Location | Sort-Object Dn | Export-Csv $CsvFile -NoTypeInformation


#================================================================================================
# Output
#================================================================================================
Write-Output "Report exported here: $csvFile"