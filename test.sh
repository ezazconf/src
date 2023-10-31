#!/bin/bash


# az monitor log-analytics workspace list --resource-group TESTRG01 | jq . > workspace.json
# jq .[].customerId workspace.json > workspaceid.txt


# define array
my_array=()

export QUERY1="StorageBlobLogs | where OperationName contains 'property' | where ObjectKey contains 'index.html'"
export QUERY2="StorageBlobLogs | where OperationName contains 'create'"
export QUERY3="StorageBlobLogs | where OperationName contains 'set'"
export QUERY4="StorageFileLogs | where OperationName contains 'property'| where ObjectKey contains 'temp.txt'"


# path to file to read
file_path="workspaceid.txt"

# read line by line
# e.g., az monitor log-analytics query -w "d9965e6a-15ea-41ba-a44e-5b853f96155b" --analytics-query "StorageBlobLogs | where OperationName contains 'property' | where ObjectKey contains 'index.html'"
while IFS= read -r line
do
    # store each line into variable 
    my_array+=("$line")
    az monitor log-analytics query -w $line --analytics-query "$QUERY1" > res_${line}_opt_1.log
    az monitor log-analytics query -w $line --analytics-query "$QUERY2" > res_${line}_opt_2.log
    az monitor log-analytics query -w $line --analytics-query "$QUERY3" > res_${line}_opt_3.log
    az monitor log-analytics query -w $line --analytics-query "$QUERY4" > res_${line}_opt_4.log

done < "$file_path"
