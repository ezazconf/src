#!/bin/bash
# https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-create-new-alert-rule?tabs=log

echo "*auth"
az login

pwsh pwsh_auth.sh

echo "*making logic app"
source making_logic_app.sh

echo "*making action group"
source making_action_group.sh

rg="TestRG01"
alertname="TestAlert"

# query='ContainerLogV2 
# | where ContainerName !has \"sms-management\" 
# | where LogMessage has \"Exception\" 
# | where TimeGenerated > ago(1h)'
# # StorageBlobLogs | where OperationName contains "create" | where TimeGenerated > ago(1h)

workspacename="DefaultLAWorkspace"

export WID1="$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspacename --query id --out tsv)"

WID="/subscriptions/f0b9ad03-d225-4217-9bfc-4b0773b2650e/resourcegroups/testrg01/providers/microsoft.operationalinsights/workspaces/defaultlaworkspace"

SWID=$WID1
echo $SWID

echo $WID


# making an alert
echo "*making an alert"
az monitor scheduled-query create -g $rg -n $alertname --scopes $WID --condition "count 'Placeholder_1' > 0 resource id _ResourceId at least 1 violations out of 5 aggregated points" --condition-query Placeholder_1="StorageBlobLogs | where OperationName contains 'create' | where TimeGenerated > ago(1h)" --action-groups "/subscriptions/F0B9AD03-D225-4217-9BFC-4B0773B2650E/resourceGroups/TestRG01/providers/microsoft.insights/actionGroups/MyActionGroup"


