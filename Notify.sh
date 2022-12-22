#!/bin/bash

while true; do
  mosquitto_sub -C 1 -h training.mcci.io -t test -p 8883 -u shashi -P shashi --capath /etc/ssl/certs/ > temp.txt
  mv temp.txt newtest.txt
  #awk '/..message../{print substr($0, index($0,"message") - 1, 29);}' newtest.txt > shashi.txt
  #awk '/..Base station../{print substr($0, index($0,"Base station") - 0, 24);}' newtest.txt >> shashi.txt
  #awk '/..latitude../{print substr($0, index($0,"latitude") - 0, 29);}' newtest.txt >> shashi.txt
  #awk '/..longitude../{print substr($0, index($0,"longitude") - 0, 30);}' newtest.txt >> shashi.txt
  awk -F, 'NF > 1 { $1 = $2 } { print $1 }' newtest.txt > shashi.txt
  awk -F, 'NF > 1 { $1 = $3 } { print $1 }' newtest.txt >> shashi.txt
  < shashi.txt mail -s "MQTTS MAIL STATUS" "shashi@mcci.com, athisankar@mcci.com"
done