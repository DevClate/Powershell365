[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory)]
    [string]$SenderAddress

)

Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName

#Removes user from restricted users
Remove-BlockedSenderAddress -SenderAddress $SenderAddress

Read-Host -Prompt "Press Enter to exit"
