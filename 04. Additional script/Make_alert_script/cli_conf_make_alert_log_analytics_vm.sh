#!/bin/bash
# virtual image version

az login


$rg="ResourceGroup"
$workspace="ws"

$query='ContainerLogV2 
| where ContainerName !has \"sms-management\" 
| where LogMessage has \"Exception\" 
| where TimeGenerated > ago(1h)'

$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

$VID = XXX

az monitor scheduled-query create -g $WID -n "testalert01" --scopes $VID --condition "count \'union Event, Syslog | where TimeGenerated > a(1h) | where EventLevelName == \"Error\" or SeverityLevel== \"err\"\' > 2" --description "vmrelatedalert"