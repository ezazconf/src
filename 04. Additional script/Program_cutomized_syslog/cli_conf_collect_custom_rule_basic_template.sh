#!/bin/bash

$tableParams = @'
{
   "properties": {
       "schema": {
              "name": "{TableName}_CL",
              "columns": [
       {
                               "name": "TimeGenerated",
                               "type": "DateTime"
                       }, 
                      {
                               "name": "RawData",
                               "type": "String"
                      }
             ]
       }
   }
}
'@



Invoke-AzRestMethod -Path "/subscriptions/f0b9ad03-d225-4217-9bfc-4b0773b2650e/resourcegroups/testrg01/providers/microsoft.operationalinsights/workspaces/DefaultLAWorkspace/tables/process_ppid_CL?api-version=2021-12-01-preview" -Method PUT -payload $tableParams