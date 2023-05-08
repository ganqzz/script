#!/bin/sh

echo === input redirect ===
count=0
while read i
do
  count=`expr $count + 1`
  echo "now count = $count"
done < /etc/passwd
echo "Last count = $count"

# while loop runs in a sub-shell (bash, dash)
echo
echo === input from pipe ===
count=0
cat /etc/passwd | while read i
do
  count=`expr $count + 1`
  echo "now count = $count"
done
echo "Last count = $count"
