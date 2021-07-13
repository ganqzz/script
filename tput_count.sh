#!/bin/sh
echo -n Count:
tput sc

count=0
while true
do
  if [ $count -lt 10 ]
  then
    tput rc
    tput ed
    echo -n $count
    sleep 1
    count=`expr $count + 1`
  else break
  fi
done
echo
