#!/bin/bash

$tableParams = @'
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "dataCollectionRuleName": {
            "type": "string",
            "metadata": {
                "description": "Specifies the name of the Data Collection Rule to create."
            }
        },
        "location": {
            "type": "string",
            "metadata": {
                "description": "Specifies the location in which to create the Data Collection Rule."
            }
        },
        "workspaceName": {
            "type": "string",
            "metadata": {
                "description": "Name of the Log Analytics workspace to use."
            }
        },
        "workspaceResourceId": {
            "type": "string",
            "metadata": {
                "description": "Specifies the Azure resource ID of the Log Analytics workspace to use."
            }
        },
        "endpointResourceId": {
            "type": "string",
            "metadata": {
                "description": "Specifies the Azure resource ID of the Data Collection Endpoint to use."
            }
        }
    },
    "resources": [
        {
            "type": "Microsoft.Insights/dataCollectionRules",
            "name": "[parameters('dataCollectionRuleName')]",
            "location": "[parameters('location')]",
            "apiVersion": "2021-09-01-preview",
            "properties": {
                "dataCollectionEndpointId": "[parameters('endpointResourceId')]",
                "streamDeclarations": {
                    "Custom-MyLogFileFormat": {
                        "columns": [
                            {
                                "name": "TimeGenerated",
                                "type": "datetime"
                            },
                            {
                                "name": "RawData",
                                "type": "string"
                            }
                        ]
                    }
                },
                "dataSources": {
                    "logFiles": [
                        {
                            "streams": [
                                "Custom-MyLogFileFormat"
                            ],
                            "filePatterns": [
                                "C:\\JavaLogs\\*.log"
                            ],
                            "format": "text",
                            "settings": {
                                "text": {
                                    "recordStartTimestampFormat": "ISO 8601"
                                }
                            },
                            "name": "myLogFileFormat-Windows"
                        },
                        {
                            "streams": [
                                "Custom-MyLogFileFormat" 
                            ],
                            "filePatterns": [
                                "//var//*.log"
                            ],
                            "format": "text",
                            "settings": {
                                "text": {
                                    "recordStartTimestampFormat": "ISO 8601"
                                }
                            },
                            "name": "myLogFileFormat-Linux"
                        }
                    ]
                },
                "destinations": {
                    "logAnalytics": [
                        {
                            "workspaceResourceId": "[parameters('workspaceResourceId')]",
                            "name": "[parameters('workspaceName')]"
                        }
                    ]
                },
                "dataFlows": [
                    {
                        "streams": [
                            "Custom-MyLogFileFormat"
                        ],
                        "destinations": [
                            "[parameters('workspaceName')]"
                        ],
                        "transformKql": "source",
                        "outputStream": "Custom-MyTable_CL"
                    }
                ]
            }
        }
    ],
    "outputs": {
        "dataCollectionRuleId": {
            "type": "string",
            "value": "[resourceId('Microsoft.Insights/dataCollectionRules', parameters('dataCollectionRuleName'))]"
        }
    }
}
'@



Invoke-AzRestMethod -Path "/subscriptions/f0b9ad03-d225-4217-9bfc-4b0773b2650e/resourcegroups/testrg01/providers/microsoft.operationalinsights/workspaces/DefaultLAWorkspace/tables/process_ppid_CL?api-version=2021-12-01-preview" -Method PUT -payload $tableParams