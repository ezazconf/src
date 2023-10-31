#!/bin/bash
# resource group version

az login


$rg="ResourceGroup"
$workspace="ws"

$query='ContainerLogV2 
| where ContainerName !has \"sms-management\" 
| where LogMessage has \"Exception\" 
| where TimeGenerated > ago(1h)'

$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

az monitor scheduled-query create \
    --name "TestQuery" \
    --resource-group $rg \
    --scopes $workspace \
    --description "Test" \
    --action $ActionID \
    --evaluation-frequency 5m \
    --severity 1 \
    --condition "" \ #Provide the required condition
    --condition-query $query