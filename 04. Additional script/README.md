# Additional script
This page includes additional script that we used for the project.  
Note that some of them are not executable as we removed credential-related contents from the script.
Refer the script and fill your own information to use the code.

## Log collection tool
`cli_get_log.sh`: Tool to store logs required complex queries (using portal is slow)

## Alert making tool
`cli_conf_make_alert_log_analytics_rg.sh`: Tool to make and configure alerts using logs from resource group
`cli_conf_make_alert_log_analytics_vm.sh``: Tool to make and configure alerts using logs from virtual machine
`cli_conf_make_alert_metric_vm.sh`: Tool to make and configure alerts using metrics from virtual machine

## Customized log making tool in Linux
`vm_additional_log_syslog.sh`: Tool to define custom logs and collect them designated folder (/var/log) in Linux VM.
`cli_conf_collect_custom_rule_basic_template.sh`: Tool to set the basic custom log template.
`cli_conf_collect_custom_rule_resource_manager_template.sh`: Tool to set the custom log template (complex format).
`cli_check_custom_log_exists.sh`: Tool to verify custom log that we made exists.

## CVE reproducing tool
### CVE_2020_1747
`install_cve_2020_1747.sh`: Install the specific (vulnerable) version of PyYAML and POC from GitHub
run_cve_2020_1747.sh: Install the required packages and execute the Python script (POC)
### CVE_2021_38647
`install_cve_2021_38647.sh`: Install the required specific (vulnerable) version of the OMI and POC
`run_cve_2021_38647.sh`: Execute Python script (POC)
### CVE_2022_39327
`install_cve_2022_39327.sh`: Download the specific (vulnerable) version of Azure CLI
`run_cve_2022_39327.sh`: Execute vulnerable command in az command line
### CVE_2023_23383
`install_cve-2023-23383.sh`: Download the specific (vulnerable) version of Azure Service Fabric
`deploy_azure_monitor.sh`: Tool to configure Azure monitor in Windows and collect Service Fabric logs

## Missing detail checking tool
### Missing detail in policy commands
`run_policy_list.sh`: Tool to run the list of policy commands
check_log_policy_list.sh: Tool to check if operation names are different
### Missing detail in option-related commands
`run_cmd_with_option.sh`: Tool to run the list of commands that changes options
`check_log_option_list.sh`: Tool to check if the changed options are logged or not
### Missing detail in table contents
`run_table_contents_list.sh`: Tool to run the list of commands for changing table contents
`check_log_table_contents.sh`: Tool to check if the log has the detail or not
  ## No log commands
`run_nolog_cmd_list.sh`: Tool to run the list of commands that do not log
`check_nolog_cmd_list.sh`: Tool to check if the log is created or not
