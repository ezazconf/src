#!/bin/bash
# Missing detail of policy

az login

# common env here
$CONT="mycontainer"
$NAME="VEP"

$PNAME="mypolicy"
$TNAME="test03"
$QNAME="queuetest"
$SNAME="sharetemp"

$STORAGE="myaccount"

$acckey=000000
$accname="TESTMYACC"

# add here
az storage container policy create --container-name $CONT --name $NAME
az storage container policy delete --container-name $CONT --name $NAME
az storage container immutability-policy create --container-name $CONT --name $NAME
az storage table policy create --name $PNAME --table-name $TNAME
az storage table policy delete --name $PNAME --table-name $TNAME
az storage queue policy create --name $PNAME --queue-name $QNAME
az storage queue policy delete --name $PNAME --queue-name $QNAME
az storage share policy create --name $PNAME --share-name $SNAME
az storage container-rm update --storage-account $STORAGE --name $CONT --public-access blob
az storage blob service-properties delete-policy update --account-name $accname --account-key $acckey --days-retained 7 --enable true
