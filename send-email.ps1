# Get the credential
$credential = Get-Credential
$UserName = Read-Host "Enter Users Full Name"
$UserEmail = Read-Host "Enter Users Email"

#Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName username@yourdomain.com

## Define the Send-MailMessage parameters
$mailParams = @{
    SmtpServer                 = 'smtp.office365.com'
    Port                       = '587' # or '25' if not using TLS
    UseSSL                     = $True ## or not if using non-TLS
    Credential                 = $credential
    From                       = 'from@yourdomain.com'
    To                         = 'to@yourdomain.com'
    Subject                    = "subject line can use variables"
    Body                       = "body of email and can use variables here too"
    DeliveryNotificationOption = 'OnFailure', 'OnSuccess'
}

## Send the message
Send-MailMessage @mailParams