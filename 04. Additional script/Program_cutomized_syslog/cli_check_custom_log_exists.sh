# Usage:
# .\ GenerateCustomLogs.ps1 5 <- [interval to sleep]

param (
    [Parameter(Mandatory=$true)][int]$sleepSeconds
)

$logFolder = "c:\\JavaLogs"
if (!(Test-Path -Path $logFolder))
{
    mkdir $logFolder
}

$logFileName = "TestLog-$(Get-Date -format yyyyMMddhhmm).log"
do
{
    $count++
    $randomContent = New-Guid
    $logRecord = "$(Get-Date -format s)Z Record number $count with random content $randomContent"
    $logRecord | Out-File "$logFolder\\$logFileName" -Encoding utf8 -Append
    Start-Sleep $sleepSeconds
}
while ($true)