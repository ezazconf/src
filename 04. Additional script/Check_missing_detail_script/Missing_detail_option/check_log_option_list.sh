#!/bin/bash

az login

$rg="rg03"
$workspace="wscj03"
$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

# add here
# az storage file resize --path "./test/temp.txt" --share-name "testcj03share" --size 100
# az storage blob service-properties update --404-document error.html --account-name $STORAGE --account-key $acckey --index-document index.html --static-website true
# az storage container metadata update --name $CONT --account-name $STORAGE --account-key $acckey
# az storage container restore --deleted-version "0101" --name $STORAGE

$query1="StorageBlobLogs | where OperationName contains 'property' | where ObjectKey contains 'index.html'"
$query2="StorageBlobLogs | where OperationName contains 'create'"
$query3="StorageBlobLogs | where OperationName contains 'set'"
$query4="StorageFileLogs | where OperationName contains 'property'| where ObjectKey contains 'temp.txt'"



# store
az monitor log-analytics query -w $WID --analytics-query $query1 > res_opt_1.log
az monitor log-analytics query -w $WID --analytics-query $query2 > res_opt_2.log
az monitor log-analytics query -w $WID --analytics-query $query3 > res_opt_3.log
az monitor log-analytics query -w $WID --analytics-query $query4 > res_opt_4.log