[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $VM_Name,
    [Parameter(Mandatory=$true)]
    [string]
    $VM_Switch
      )
Get-VMSwitch * | Format-Table Name
New-VM -Name $VM_Name -MemoryStartupBytes 4GB -BootDevice VHD -NewVHDPath C:\Virtual\VMs\$VM_Name.vhdx -Path C:\Virtual\VMData -NewVHDSizeBytes 30GB -Generation 1 -SwitchName Skakalski_Virtual_Switch_internal
Set-VMDvdDrive -VMName $VM_Name -Path F:\Images\Windows_server_2019\17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso
Set-VM -Name $VM_Name -CheckpointType Disabled
Start-VM $VM_Name
