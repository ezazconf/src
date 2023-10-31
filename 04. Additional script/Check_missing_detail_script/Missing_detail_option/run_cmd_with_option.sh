#!/bin/bash
# Missing detail of option

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
az storage file resize --path "./test/temp.txt" --share-name "testcj03share" --size 100
az storage blob service-properties update --404-document error.html --account-name $STORAGE --account-key $acckey --index-document index.html --static-website true

az storage container metadata update --name $CONT --account-name $STORAGE --account-key $acckey
az storage container restore --deleted-version "0101" --name $STORAGE
