#!/bin/bash

az login

# path to file to read
file_path="workspaceid.txt"

rg="ResourceGroup"
workspace="ws"

$query='ContainerLogV2 
| where ContainerName !has \"sms-management\" 
| where LogMessage has \"Exception\" 
| where TimeGenerated > ago(1h)'

# read line by line
# e.g., az monitor log-analytics query -w "d9965e6a-15ea-41ba-a44e-5b853f96155b" --analytics-query "StorageBlobLogs | where OperationName contains 'property' | where ObjectKey contains 'index.html'"
while IFS= read -r line
do
    # store each line into variable 
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

done < "$file_path"
