#!/bin/bash

az login

$rg="ResourceGroup"
$workspace="ws"
$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

$query="Syslog | where Computer == 'U2004CVE'"
# $query="Heartbeat | where OSType == 'Windows' | where Category != 'Azure Monitor Agent' | summarize arg_max TimeGenerated, *) by SourceComputerId | sort by Computer | render table"

az monitor log-analytics query -w $WID --analytics-query $query > req_log.log