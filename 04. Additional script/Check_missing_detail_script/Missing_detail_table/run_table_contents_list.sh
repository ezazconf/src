#!/bin/bash
# Missing contents of table

az login

# common env here
$CONT="mycontainer"
$NAME="VEP"

$PNAME="mypolicy"
$TNAME="test03"
$QNAME="queuetest"
$SNAME="sharetemp"

$STORAGE="myaccount"

$connectionString = BDE884804588CE55DFA8D48AB494CD91DC1F6B3F402E34191CE0ED8A663CB37B

# add here
az storage entity replace --entity PartitionKey=AAA RowKey=BBB Content=REPLACE --if-exists fail --table-name $TNAME --connection-string $connectionString
az storage entity insert --entity PartitionKey=AAA RowKey=BBB Content=ASDF2 --if-exists fail --table-name $TNAME --connection-string $connectionString

# az storage entity delete --entity PartitionKey=AAA RowKey=BBB Content=ASDF2 --if-exists fail --table-name $TNAME --connection-string $connectionString
# az storage entity merge --entity PartitionKey=AAA RowKey=BBB Content=ASDF2 --if-exists fail --table-name $TNAME --connection-string $connectionString
# az storage entity query --table-name $TNAME --connection-string $connectionString	
# az storage entity show --entity PartitionKey=AAA RowKey=BBB --if-exists fail --table-name $TNAME --connection-string $connectionString	

