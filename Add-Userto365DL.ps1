[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$UserPrincipalName,
    
    [Parameter(Mandatory)]
    [string]$DistributionGroupName,
    
    [Parameter(Mandatory)]
    [string]$Membertoadd
    
)

#Connecting with MFA Exchange Online EXO V2
Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName -ShowProgress $true

#Add User to DL
Add-DistributionGroupMember -Identity "$DistributionGroupName" -Member $Membertoadd

Read-Host -Prompt "Press Enter to exit"