# Tenant Block Users on 365

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $UserPrincipalName,
    [Parameter(Mandatory)]
    [string[]]
    $Entries

)

#Connecting with MFA Exchange Online EXO V2
Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName -ShowProgress $true

#Add User to Block
New-TenantAllowBlockListItems -ListType Sender -Block -Entries $Entries

Disconnect-ExchangeOnline

Read-Host -Prompt "Press Enter to exit"