
pwsh get_callback.sh

url=$(grep -o 'https://[^"]*' temp.log | head -n 1)

echo $url

rm temp.log

rg="TestRG01"

az monitor action-group create --name MyActionGroup --resource-group $rg --action logicapp collectActivityLogs /subscriptions/f0b9ad03-d225-4217-9bfc-4b0773b2650e/resourceGroups/TestRG01/providers/Microsoft.Logic/workflows/collectActivityLogs $url