# Download specific version
# https://azcliprod.blob.core.windows.net/msi/azure-cli-2.41.0-x64.msi

# env variable
$env:SECRET_VALUE = 'abc123|curl'
$env:BENIGN_ADD = 'http://127.0.0.1:8080'

# execute
#az keyvault secret set --vault-name SomeVault --name foobar --value "abc123|"curl http://127.0.0.1:8080 --retry 12 --retry-all-errors

az keyvault secret set --vault-name SomeVault --name foobar --value $env:SECRET_VALUE $env:BENIGN_ADD
