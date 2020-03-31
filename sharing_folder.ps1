[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Login,
    [Parameter(Mandatory=$true)]
    [string]
    $Password,
    [Parameter(Mandatory=$true)]
    [string]
    $PC_Name
    )
Enable-PSRemoting -SkipNetworkProfileCheck
$Password = ConvertTo-SecureString $Password -AsPlainText -Force;
$Credential = New-Object -TypeName pscredential -ArgumentList "$Login", $Password;
Invoke-command -ScriptBlock {mkdir C:\Users\Administrator\Desktop\share-folder1;`
New-SmbShare -Name Shared -Path C:\Users\Administrator\Desktop\share-folder1 -FullAccess Everyone -Description "Shared_Folder";`
get-service -Name "FDResPub", "SSDPSRV", "upnphost" | Set-Service -StartupType Automatic -PassThru | Start-Service;`
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes} `
-ComputerName $PC_Name -Credential $Credential