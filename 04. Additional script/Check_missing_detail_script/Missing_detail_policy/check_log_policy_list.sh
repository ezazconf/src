#!/bin/bash

az login

$rg="ResourceGroup"
$workspace="wscj03"
$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

# add here

# az storage container policy create --container-name $CONT --name $NAME
# az storage container policy delete --container-name $CONT --name $NAME
# az storage container immutability-policy create --container-name $CONT --name $NAME
# az storage table policy create --name $PNAME --table-name $TNAME
# az storage table policy delete --name $PNAME --table-name $TNAME
# az storage queue policy create --name $PNAME --queue-name $QNAME
# az storage queue policy delete --name $PNAME --queue-name $QNAME
# az storage share policy create --name $PNAME --share-name $SNAME
# az storage container-rm update --storage-account $STORAGE --name $CONT --public-access blob
# az storage blob service-properties delete-policy update --account-name $accname --account-key $acckey --days-retained 7 --enable true

$query1="StorageBlobLogs \
| where OperationName contains 'set'"

$query2="StorageFileLogs \
| where OperationName contains 'write'"

$query3="StorageTableLogs \
| where OperationName contains 'property'"

$query4="StorageQueueLogs \
| where OperationName contains 'get' \
| where AccountName contains 'storagecj03'"


# store
az monitor log-analytics query -w $WID --analytics-query $query1 > res1.log
az monitor log-analytics query -w $WID --analytics-query $query2 > res2.log
az monitor log-analytics query -w $WID --analytics-query $query3 > res3.log
az monitor log-analytics query -w $WID --analytics-query $query4 > res4.log