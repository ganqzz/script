#!/usr/bin/env bash
count=1

while IFS='' read -r line  # -r: do not allow backslashes to escape any characters
do
  echo " $count: $line"
  ((count++))
done < "$1"

exit 0
