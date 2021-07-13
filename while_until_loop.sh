#!/bin/sh

echo "--- while loop ---"

cnt=1
while [ ${cnt} -le 9 ]
do
  echo "cnt = ${cnt}"
  cnt=`expr $cnt + 1`
done

echo

echo "--- until loop ---"

cnt=1
until [ ${cnt} -gt 9 ]
do
  echo "cnt = ${cnt}"
  cnt=`expr $cnt + 1`
done
