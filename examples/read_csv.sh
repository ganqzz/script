#!/bin/bash
# Filename: csv_read.sh
# Description: Read from CSV

if [[ $# -ge 1 ]]
then
  exec 3< $1
else
  exec 3< <(cat <<< "1,Navin M,98,CS
2,Kavya N,70,CS
3,Nawaz O,80,CS
4,Hari S,80,EC
5,Alex M,50,EC
6,Neenu J,70,EC
7,Bob A,30,EC
8,Anu M,90,AE
9,Sruthi,89,AE
10,Andrew,89,AE")
fi

while read line
do
  oldIFS=$IFS
  IFS=,

  values=($line)
  values[1]="\"`echo ${values[1]} | tr ' ' '#'`\""
  values[3]="\"`echo ${values[3]}`\""

  query=`echo ${values[@]} | tr ' #' ', '`
  echo $query

  IFS=$oldIFS
done <&3
