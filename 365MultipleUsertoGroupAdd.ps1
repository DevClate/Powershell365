#Read more: https://www.sharepointdiary.com/2018/05/add-members-to-office-365-group-using-powershell.html#ixzz7WCktqaLC

param (
    [Parameter(Mandatory)]
    [string]
    $UserPrincipalName
   )


#Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName
 
#PowerShell to Import Members to office 365 group from CSV
Import-CSV ".\365users.csv" | ForEach-Object {
    Add-DistributionGroupMember -Identity $_.GroupID -Member $_.Member
    Write-host -f Green "Added Member '$($_.Member)' to Office 365 Group '$($_.GroupID)'"
}

Read-Host -Prompt "Press Enter to exit"

#Disconnect Exchange Online
Disconnect-ExchangeOnline -Confirm:$False
