[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $PC_ip_address,

    [Parameter(Mandatory=$true)]
    [string]
    $Login,

    [Parameter(Mandatory=$true)]
    [string]
    $Password
      )

#Enable-PSRemoting -SkipNetworkProfileCheck
#Set-Item WSMan:\localhost\Client\TrustedHosts -Value *
$Password = ConvertTo-SecureString $Password -AsPlainText -Force;
$Credential = New-Object -TypeName pscredential -ArgumentList "$Login", $Password;
Enter-PSSession -ComputerName $PC_ip_address -Credential $Credential 