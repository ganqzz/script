#!/bin/bash
# Filename: disklog.sh
# Description: Monitor disk usage health for remote systems
logfile="/dev/stdout"

[[ -n $1 ]] && logfile=$1

printf "%-8s %-14s %-9s %-8s %-6s %-6s %-6s %s\n" "Date" "IP address" "Device" "Capacity" "Used" "Free" "Percent" "Status" > $logfile

# provide the list of remote machine IP addresses
IP_LIST="127.0.0.1"

(
  for ip in $IP_LIST
  do
    ssh falcon@$ip 'df -H' | grep ^/dev/ > /tmp/$$.df

    while read line
    do
      cur_date=$(date +%D)
      printf "%-8s %-14s " $cur_date $ip
      echo $line | awk '{ printf("%-9s %-8s %-6s %-6s %-8s",$1,$2,$3,$4,$5) }'

      pusg=$(echo $line | egrep -o "[0-9]+%")
      pusg=${pusg/\%/}
      [ $pusg -lt 80 ] && echo SAFE || echo ALERT
    done < /tmp/$$.df
  done
) >> $logfile
