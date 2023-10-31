# pwsh

# Connect-AzAccount

Get-AzLogicAppTriggerCallbackUrl -ResourceGroupName "TestRG01" -Name "collectActivityLogs" -TriggerName "manual" > temp.log

# url=$(grep -o 'https://[^"]*' temp.log | head -n 1)

# echo $url
