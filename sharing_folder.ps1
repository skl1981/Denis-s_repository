[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $PC_ip_address
    )

#Enable-PSRemoting -SkipNetworkProfileCheck
Invoke-command -ScriptBlock {mkdir C:\Users\Administrator\Desktop\share-folder1} -ComputerName $PC_ip_address -Credential Administrator
New-SmbShare -Name Shared -Path C:\Users\Administrator\Desktop\share-folder1 -CimSession $PC_ip_address -FullAccess Everyone -Description "Shared_Folder"
#get-service -Name "FDResPub", "SSDPSRV", "upnphost" | Set-Service -StartupType Automatic -PassThru | Start-Service
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
