# dimm-cve


# Reqiurements
* PowerShell 7.1 or later is [required](https://github.com/CiscoDevNet/intersight-powershell#11-requirements)
* Download PowerShell 7 [here](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)

## Install Intersight PowerShell Module
```PowerShell
Install-Module -Name Intersight.PowerShell
```

## Genereate API credentials and import as environment variables:

* Create an API key and secret key file within Intersight.  You can [generate those credentials here.](https://intersight.com/an/settings/api-keys/)
* Import the Variables into your Environment:
```PowerShell
$env:ApiKeyId = "xxxxx27564612d30dxxxxx/5f21c9d97564612d30dd575a/5f9a8b877564612xxxxxxxx" #Changeme
$env:ApiKeyFilePath = "C:\SecretKey.txt" #Changeme
```

Delivers a list of all DIMMs. This list will be a CSV and the output looks like this:

![image](https://user-images.githubusercontent.com/2009431/168175344-3398bb24-37e4-40cf-952e-230db3645f73.png)
