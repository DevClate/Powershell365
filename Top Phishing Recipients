### https://docs.microsoft.com/en-us/powershell/module/exchange/get-mailtrafficsummaryreport?view=exchange-ps
### https://o365reports.com/2021/10/06/top-10-powershell-cmdlets-for-reporting-monitoring-emails-in-office-365/#Office365_spam_report

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$UserPrincipalName,
    
    [Parameter(Mandatory)]
    $StartDate,
    
    [Parameter(Mandatory)]
    $EndDate,
    
    [Parameter(Mandatory)]
    $Path

    [Parameter(Mandatory)]
    [string]$InternalMessage
)

Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName

Get-MailTrafficSummaryReport -Category TopphishRecipient –StartDate $StartDate -EndDate $EndDate | Select-Object C1,C2 | export-csv $Path -NoTypeInformation
