[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $ip_adress,

    [Parameter(Mandatory=$true)]
    [string]
    $default_gateway,

    [Parameter(Mandatory=$true)]
    [int]
    $subnet_mask,

    [Parameter(Mandatory=$true)]
    [string]
    $PC_Name

    )
Set-ExecutionPolicy unrestricted -Force
New-NetIPAddress -ifIndex (Get-NetAdapter).ifIndex -IPAddress $ip_adress -PrefixLength $subnet_mask -DefaultGateway $default_gateway
Rename-Computer -NewName $PC_Name -Restart