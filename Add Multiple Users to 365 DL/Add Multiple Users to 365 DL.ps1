#Get Credentials to connect
$Credential = Get-Credential
#For MFA, I had to comement out the credential variable and put in my username for userprincipalname or it wouldn't work. Need to test why
  
#Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName $Credential
 
#PowerShell to Import Members to office 365 group from CSV
Import-CSV ".\365users.csv" | ForEach-Object {
    Add-DistributionGroupMember -Identity $_.GroupID -Member $_.Member
    Write-host -f Green "Added Member '$($_.Member)' to Office 365 Group '$($_.GroupID)'"
}

Read-Host -Prompt "Press Enter to exit"

#Disconnect Exchange Online
Disconnect-ExchangeOnline -Confirm:$False


#Read more: https://www.sharepointdiary.com/2018/05/add-members-to-office-365-group-using-powershell.html#ixzz7WCktqaLC