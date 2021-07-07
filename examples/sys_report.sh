#!/bin/bash
greentext="\033[32m"
bold="\033[1m"
underline="\033[4m"
normal="\033[0m"
freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')

echo -e $underline"Quick system report for"$normal$bold" $HOSTNAME"$normal
printf "\tSystem type:\t%s\n" $MACHTYPE
printf "\tBash Version:\t%s\n" $BASH_VERSION
printf "\tFree Space:\t%s\n" $freespace
printf "\tFiles in dir:\t%s\n" $(ls | wc -l)
printf "\tGenerated on:\t%s\n" $(date +"%Y-%m-%dT%T")
