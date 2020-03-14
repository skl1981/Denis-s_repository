Get-NetAdapter # Получить информацию об установленный сетевых интерфейсах и присвоенных им индексах
Get-NetIPConfiguration -Detailed # Получить информацию о настроенных IP адресах, дефолтных маршрутах, настройках DNS
Get-NetIPAddress # Получить информацию о присвоенных масках подсетей
Get-NetIPInterface # Получить расширенную информацию об IP интерфейсах, включая MTU, метрику, состояние протокола DHCP для каждого интерфейса
New-NetIPAddress -ifIndex 12 -IPAddress 10.0.5.16 -PrefixLength 24 -DefaultGateway 10.0.5.1 # Зададим интерфейсу с индексом 12 статический IP адрес с маской подсети 255.255.255.0 и маршрутом по-умолчанию
Set-DnsClientServerAddress -InterfaceIndex 12 -ServerAddresses 10.0.0.2,10.0.0.3 # Присваиваем интерфейсу с индексом 12 конфигурацию о DNS серверах
Get-NetAdapter -ifIndex 12 | Set-NetIPInterface -Dhcp Enabled # Вернем назад получение сетевым адаптером настроек IP через DHCP сервер
Get-NetAdapter -ifIndex 12 | Set-DnsClientServerAddress -ResetServerAddresses # Вернем назад получение сетевым адаптером списка DNS серверов через DHCP сервер
Get-NetAdapter -ifIndex 12 | Rename-NetAdapter -NewName 'LocalNetwork' # Переименуем сетевой интерфейс с индексом 12
New-NetRoute -InterfaceIndex 12 -DestinationPrefix "172.16.0.0/12" -NextHop 10.0.5.254 -RouteMetric 1 # Добавляем статический маршрут для подсети
Get-NetAdapterBinding -InterfaceAlias "LocalNetwork" | Set-NetAdapterBinding -Enabled:$false -ComponentID ms_tcpip6 # Отключить протокол IPv6 для сетевого адаптера с именем LocalNetwork
#Rename-Computer -NewName "ADDC" -Restart
