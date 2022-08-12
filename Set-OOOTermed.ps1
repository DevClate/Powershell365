#Sets out of office for internal and external
[CmdletBinding()]
    param (
    [Parameter(Mandatory)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory,HelpMessage='Enter the user name for OOO!')]
    [string]$UserName,

    [Parameter(Mandatory,HelpMessage='Enter Manager''s Name')]
    [string]$ManagerName,

    [Parameter(Mandatory,HelpMessage='Enter Manager''s Email')]
    [string]$ManagerEmail
    )

    $ExternalMessage = "Thank you for your email. Please note that this email address is no longer active. Please redirect your email to $ManagerName at $ManagerEmail."
    $InternalMessage = "Thank you for your email. Please note that this email address is no longer active. Please redirect your email to $ManagerName at $ManagerEmail."

#Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName


#Sets out of office for internal and external
Set-MailboxAutoReplyConfiguration -Identity $UserName -AutoReplyState Enabled -InternalMessage $InternalMessage -ExternalMessage $ExternalMessage
