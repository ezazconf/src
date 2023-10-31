#!/bin/bash

az login

$rg="rg03"
$workspace="wscj03"
$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

$query1="StorageBlobLogs \
| where TimeGenerated > ago(5m)"

$query2="StorageFileLogs \
| where TimeGenerated > ago(5m)"

$query3="StorageTableLogs \
| where TimeGenerated > ago(5m)"

$query4="StorageQueueLogs \
| where TimeGenerated > ago(5m)"

az monitor log-analytics query -w $WID --analytics-query $query1 > recent_res_1.log
az monitor log-analytics query -w $WID --analytics-query $query2 > recent_res_2.log
az monitor log-analytics query -w $WID --analytics-query $query3 > recent_res_3.log
az monitor log-analytics query -w $WID --analytics-query $query4 > recent_res_4.log