Get-Help Get-Help #Получите справку о командлете справки.
Get-Help Get-Help -Detailed # Пункт1, но детальную справку
Get-Help Get-Help -Examples # Пункт1, примеры.
Get-Help about_Windows_PowerShell_5.0 #	Получите справку о новых возможностях в PowerShell 4.0 (или выше)
Get-Command -CommandType Cmdlet -Name set* #Получите все командлеты установки значений (типы данных в повершелл)
Get-Command -Name *item #Получить список команд работы с файлами
Get-Command -CommandType Alias #Получите список всех псевдонимов
New-Alias -Name gd -Value Get-Date #Создайте свой псевдоним для любого командлета
Get-process | Get-Member #Просмотреть список методов и свойств объекта типа процесс
'string'| Get-Member    #Просмотреть список методов и свойств объекта типа строка
Get-Process #Получить список запущенных процессов
Get-Process -Name chrome #Данные об определённом процессе
Get-Service #Получить список всех сервисов
Get-Service -Name Browser #Данные об определенном сервисе
Get-Package -Name *win* #Получить список обновлений системы
Get-WinUserLanguageList #Узнайте, какой язык установлен для UI Windows
Get-Data #Получите текущее время и дату
Get-Random #Сгенерируйте случайное число (любым способом)
(Get-Process -Name explorer).StartTime #Выведите дату и время, когда был запущен процесс «explorer».
(Get-Process -Name explorer).StartTime.DayOfWeek # Получите какой это день недели.
Get-Process -Name WINWORD | Stop-Process -Force # 18.	Откройте любой документ в MS Word (не важно как) и закройте его с помощью PowerShell
<# Подсчитать значение выражения S= . N – изменяемый параметр. Каждый шаг выводить в виде строки. (Пример: На шаге 2 сумма S равна 9)  #>
$d = 0
$i = 0
Do{$i++
$k=3*$i
$d=$d+$k
$f = "На шаге " 
$f1 = " cумма S равна "
$f + $i + $f1 + $d}
While ($i-lt10)
<#Напишите функцию для предыдущего задания. Запустите её на выполнение#>
function sum ($s)
{
$d = 0
$i = 0
Do{$i++
$k=3*$i
$d=$d+$k
$f = "На шаге " 
$f1 = " cумма S равна "
$f + $i + $f1 + $d
}
While ($i-lt$s)
}
sum 10
