#!/bin/bash

while true; do
  mosquitto_sub -C 1 -h training.mcci.io -t test -p 8883 -u shashi -P shashi --capath /etc/ssl/certs/ > temp.txt
  mv temp.txt newtest.txt
  < newtest.txt mail -s "MAIL VaNdHu IrUkU" "shashi@mcci.com"
done