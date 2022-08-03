[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$UserPrincipalName,
    
    [Parameter(Mandatory)]
    [string]$SenderAddress
    
)

Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName

Remove-BlockedSenderAddress -SenderAddress $SenderAddress

Read-Host -Prompt "Press Enter to exit"