# Automatic configuration tool for Azure

This page describes a prototype tool that can configure log alerts and log collection rule automatically.  
This tool leverages followings in Azure:

- Log alert
- Action group
- Logic apps

Also, this tool does not store user's authentication information.
It will show login page through your browser.

## Prerequisite

Most of work will be done automatically, but we assume:

- The user has a subscribtion of Azure, [CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt) and [Az powershell](https://learn.microsoft.com/en-us/powershell/azure/install-azps-linux?view=azps-10.4.1) in user's machine.
- The user has basic knowledge about how to use log analytics, storage accout, etc.

If you want to change the details of the tool, feel free to modify it.
Code is in [01. Tool](/01.%20Tool) folder.
Also, you can change the details in Azure portal directly.
You will see the resources made by the tool after an execution.

## How to use the tool

Type `source making_alert.sh` in your terminal where you installed Azure CLI.

- It will make logic apps to make log collection rules. The log collection rule collects Azure activity logs when alert is fired.
- Then it will make action group that connects the log alert and the logic app.
- Lastly, it will make log alert that fires an alert when the given condition is met.
  - e.g., when "storage blob is created" (suspicious behavior).

## Additional tool
