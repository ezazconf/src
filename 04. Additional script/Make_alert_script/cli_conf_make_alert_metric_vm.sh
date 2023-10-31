#!/bin/bash
# virtual image version

az login


$rg="ResourceGroup"
$workspace="ws"

$WID=$(az monitor log-analytics workspace show --resource-group $rg --workspace-name $workspace --query id --out tsv)

$VID = /subscriptions/f0b9ad03-d225-4217-9bfc-4b0773b2650e/resourceGroups/CVE_rep/providers/Microsoft.Compute/virtualMachines/U2004CVE02

az monitor scheduled-query create -g $WID -n "testalert01" --scopes $VID --condition --condition "avg Percentage CPU > 90" --description "vmrelatedalert"

