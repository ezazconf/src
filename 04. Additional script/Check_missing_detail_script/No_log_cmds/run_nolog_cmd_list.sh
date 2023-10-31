
#!/bin/bash
# below cmds may not have log
# execute and check if there is log or not

az login

# common env here
$CONT="mycontainer"
$NAME="VEP"

$PNAME="mypolicy"
$TNAME="test03"
$QNAME="queuetest"
$SNAME="sharetemp"

$STORAGE="myaccount"
$acckey=000000
$accname="TESTMYACC"
$rg="rg03"

$policyid="04344ea7-aa3c-4846-bfb9-e908e32d3bf8"
$ruleid="78746d86-d3b7-4397-a99c-0837e6741332"
$subid="/subscriptions/0000-0000-0000-0000/resourceGroups/MyResourceGroup/providers/Microsoft.Storage/storageAccounts/mystorageaccount/privateEndpointConnections/mystorageaccount.b56b5a95-0588-4f8b-b348-15db61590a6c"

az storage account blob-inventory-policy show --account-name $accname --resoure-group $rg
az storage account blob-service-properties show --account-name $accname --resoure-group $rg
az storage account check-name --name $STORAGE
az storage account encryption-scope show --account-name $accname --resoure-group $rg --name "testenc"
az storage account file-service-properties show --account-name $accname --resoure-group $rg
az storage account network-rule list --account-name $accname --resoure-group $rg 
az storage account or-policy list --account-name $accname --resoure-group $rg
az storage account or-policy rule list --account-name $accname --resoure-group $rg --policy-id $policyid
az storage account or-policy rule show --account-name $accname --resoure-group $rg --policy-id $policyid --rule-id $ruleid
az storage account or-policy show --account-name $accname --resoure-group $rg --policy-id $policyid
az storage account private-endpoint-connection show -account-name $accname --resoure-group $rg --id $subid --name "testend"
az storage account private-link-resource list --account-name $accname --resoure-group $rg
az storage account show --ids $subid 
az storage account show-usage --location eastus
