#Created 4/14/2022
#Sets a scheduled out of office for interal users
#Email body doesn't pull date from Start/End time yet, needs to be manually inputted for now
#21:30:00 is 5:30PM Eastern Time

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $UserPrincipalName,
    [Parameter(Mandatory,HelpMessage='Enter the user name for OOO')]
    [string]
    $UserName,
    [Parameter(Mandatory,HelpMessage='Enter start time, ex 04/14/2022 21:30:00')]
    [string]
    $StartTime,
    [Parameter(Mandatory,HelpMessage='Enter end time, ex 04/14/2022 21:30:00')]
    [string]
    $EndTime,
    [Parameter(Mandatory,HelpMessage='Enter Manager Name')]
    [string]
    $ManagerName,
    [Parameter(Mandatory,HelpMessage='Enter Ext of manager')]
    [string]
    $Ext,
    [Parameter(Mandatory,HelpMessage='Enter Ext of Help')]
    [string]
    $ExtHelp,
    $InternalMessage = "Thank you for your email. I will be out of the office Wednesday, 8/24 with a return date of Friday, 8/26. If your email is of urgent nature, please contact the help desk at extension $ExtHelp. If you need immediate assistance, please contact $ManagerName at extension $Ext. Thank you."

)

Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName

#Sets out of office for internal
Set-MailboxAutoReplyConfiguration -Identity $UserName -AutoReplyState Scheduled -StartTime $StartTime -EndTime $EndTime -InternalMessage $InternalMessage
