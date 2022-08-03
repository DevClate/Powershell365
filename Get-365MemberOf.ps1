[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$UserPrincipalName,
    
    [Parameter(Mandatory,HelpMessage='Enter the user name to see which 365 groups they are apart of!')]
    [string]$UserName
    
)

Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName
$dn = (Get-EXOMailbox $UserName).DistinguishedName

Get-EXORecipient -Filter "Members -eq '$dn'"
Read-Host -Prompt "Press Enter to exit"