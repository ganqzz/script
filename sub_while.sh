#!/bin/sh

echo === input redirect ===
count=0
while read i
do
  count=`expr $count + 1`
  echo "now count = $count"
done < /etc/passwd
echo "Last count = $count"

echo
echo === exec redirect ===
count=0
exec 9<&0 < /etc/passwd
while read i
do
  count=`expr $count + 1`
  echo "now count = $count"
done
exec 0<&9 9<&-
echo "Last count = $count"

# while loop in sub-shell
echo
echo === input from pipe ===
count=0
cat /etc/passwd | while read i
do
  count=`expr $count + 1`
  echo "now count = $count"
done
echo "Last count = $count"
