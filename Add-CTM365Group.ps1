<#
.SYNOPSIS
Basic way to add a 365 Group to your tenant

.DESCRIPTION
This is a quick standardized way to add a 365 Group to your tenant. Look over the the New-UnifiedGroup Cmdlet 
to add any feautures you want to standardized

.PARAMETER DisplayName
The DisplayName parameter specifies the name of the Microsoft 365 Group. The display name is visible in the 
Exchange admin center, address lists, and Outlook. The maximum length is 64 characters. If the value 
contains spaces, enclose the value in quotation marks (").

.PARAMETER Alias
The Alias parameter specifies the Exchange alias (also known as the mail nickname) for the Microsoft 365 
Group. This value identifies the recipient as a mail-enabled object, and shouldn't be confused with multiple 
email addresses for the same recipient (also known as proxy addresses). A recipient can have only one Alias 
value. The maximum length is 64 characters.

.PARAMETER Notes
The Notes parameter specifies the description of the Microsoft 365 Group. If the value contains spaces, 
enclose the value in quotation marks.

.EXAMPLE
Add-CTM365Group -DisplayName "365Testing 1" -Alias 365Testing1 -Notes "This is a test 365 Group"

.NOTES
Look over the New-UnifiedGroup Cmdlet to add any other parameters your org requires
#>
function Add-CTM365Group {
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(Mandatory)] [string]$DisplayName,
        [Parameter(Mandatory)] [string]$Alias,
        [Parameter(Mandatory)] [string]$Notes
    )

    # Import the Exchange Online PowerShell module
    Import-Module ExchangeOnlineManagement

    if ($PSCmdlet.ShouldProcess("Creating group '$DisplayName'")) {
        try {
            $NewGroup = New-UnifiedGroup -DisplayName $DisplayName -Alias $Alias -Notes $Notes -AccessType Private -WhatIf:$WhatIfPreference -Confirm:$false
            if ($NewGroup) {
                Write-Host "Group '$DisplayName' created successfully!" -ForegroundColor Green
                return $NewGroup
            } else {
                Write-Host "Group creation failed for '$DisplayName'." -ForegroundColor Red
                return $null
            }
        } catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
            return $null
        }
    }
}