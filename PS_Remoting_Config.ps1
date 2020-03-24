Enable-PSRemoting -SkipNetworkProfileCheck
Set-Item WSMan:\localhost\Client\TrustedHosts -Value *
$Password = ConvertTo-SecureString '12#QWEasd' -AsPlainText -Force;
$Credential = New-Object -TypeName pscredential -ArgumentList "Administrator", $Password;
Enter-PSSession -ComputerName 192.168.137.5 -Credential $Credential 