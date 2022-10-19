[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $UserPrincipalName
    
)

#Connecting with MFA Exchange Online EXO V2
Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName -ShowProgress $true

#Add User to DL
Get-TenantAllowBlockListItems -ListType Sender

Disconnect-ExchangeOnline

Read-Host -Prompt "Press Enter to exit"