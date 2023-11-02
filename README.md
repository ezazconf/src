# Automatic configuration tool for Azure

This page describes a prototype tool that can configure log alerts and log collection rule automatically.  
This tool leverages followings in Azure:

- [Log alert](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-create-new-alert-rule?tabs=metric)
- [Action group](https://learn.microsoft.com/en-us/cli/azure/monitor/action-group?view=azure-cli-latest)
- [Logic apps](https://learn.microsoft.com/en-us/cli/azure/logic/workflow?view=azure-cli-latest)

Also, this tool does not store user's authentication information.
It will show login page on your browser.

## Prerequisite

Most of work will be done automatically, but we assume:

- The user has a subscribtion of Azure, [CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt) and [Az powershell](https://learn.microsoft.com/en-us/powershell/azure/install-azps-linux?view=azps-10.4.1) in user's machine.
- The user has basic knowledge about how to use log analytics, storage accout, etc.

If you want to change the details of the tool, feel free to modify it.
Code is in [01. Tool](/01.%20Tool) folder.
Also, you can change the details in Azure portal directly.
You will see the resources made by the tool after an execution.

## How to use the tool

`source making_alert.sh` in your terminal where you installed Azure CLI.

- It will make logic apps to make log collection rules. The log collection rule collects Azure activity logs when alert is fired.
- Then it will make action group that connects the log alert and the logic app.
- Lastly, it will make log alert that fires an alert when the given condition is met.
  - e.g., when "storage blob is created" (suspicious behavior).

You can see how it works thorugh demo video in [02. video](/02.%20video/).

## Additional tool
We add several script that we used for the project.  
There are log collection tool, alert making tool, customized log making tool in Linux, CVE reproducing tool and missing detail checking tool.
