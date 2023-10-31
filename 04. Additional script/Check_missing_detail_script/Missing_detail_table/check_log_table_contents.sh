#!/bin/bash

az login

$rg="rg03"
$workspace="wscj03"
$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

# add here
# az storage entity replace --entity PartitionKey=AAA RowKey=BBB Content=REPLACE --if-exists fail --table-name $TNAME --connection-string $connectionString
# az storage entity insert --entity PartitionKey=AAA RowKey=BBB Content=ASDF2 --if-exists fail --table-name $TNAME --connection-string $connectionString

# query
$query1="StorageTableLogs | where OperationName contains 'property' | where ObjectKey contains 'REPLACE'"
$query2="StorageTableLogs | where OperationName contains 'property' | where ObjectKey contains 'ASDF2'"

# store
az monitor log-analytics query -w $WID --analytics-query $query1 > res_opt_1.log
az monitor log-analytics query -w $WID --analytics-query $query2 > res_opt_2.log