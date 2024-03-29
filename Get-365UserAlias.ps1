Param (
    [Parameter(Mandatory)]
    [string]$Identity
)

#Gets Users Proxy Addresses
Get-ADUser -Identity $identity -Properties proxyaddresses | Select-Object Name, @{L = "ProxyAddresses"; E = { ($_.ProxyAddresses -like 'smtp:*') -join ";"}}
