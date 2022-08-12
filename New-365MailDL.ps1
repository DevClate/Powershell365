#Create a 365 Mail Distribution List and add member
#Created 4/14/2022

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory,HelpMessage='Enter the user name to add to group')]
    [string]$UserName,

    [Parameter(Mandatory,HelpMessage='Type in Distribution name')]
    [string]$DistributionName,

    [Parameter(HelpMessage='Display Name of Distribution Group')]
    [string]$DisplayName,

    [Parameter(Mandatory,HelpMessage='Type in managed by user')]
    [string]$ManagedByUser
)

#Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName -ShowProgress $true

New-DistributionGroup -Name "$DistributionName" -Members $UserName -DisplayName $DisplayName -ManagedBy $ManagedByUser -PrimarySmtpAddress $DistributionName@domain.com
