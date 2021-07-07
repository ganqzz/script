#!/bin/bash

echo "--- while loop ---"

CTR=1
while [ ${CTR} -le 9 ]
do
  echo "CTR = ${CTR}"
  ((CTR++))
done

echo

echo "--- until loop ---"

CTR=1
until [ ${CTR} -gt 9 ]
do
  echo "CTR = ${CTR}"
  ((CTR++))
done
