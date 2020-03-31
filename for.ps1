for($i=0; $i -lt 5; $i++) {Write-Host $i}
$letterArray = "a","b","c","d"
foreach ($letter in $letterArray){Write-Host $letter}
$l=0; foreach($f in dir *.*){$l+=$f.Length}
$l
Get-Process | Get-Member -MemberType