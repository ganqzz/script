#!/bin/bash
# Name: pcpu_usage.sh
# Description: Script to calculate cpu usage by processes for 1 hour

# Change the SECS to total seconds for which monitoring is to be performed.
# UNIT_TIME is the interval in seconds between each sampling
SECS=3600
UNIT_TIME=60
STEPS=$((SECS / UNIT_TIME))
TMP_FILE=/tmp/cpu_usage.$$

trap "rm -f $TMP_FILE 2> /dev/null; exit 1" SIGINT

echo Watching CPU usage...

for ((i=0; i < STEPS; i++))
do
  ps -eocomm,pcpu | tail -n +2 >> $TMP_FILE
  sleep $UNIT_TIME
done

echo
echo CPU eaters :

cat $TMP_FILE | \
awk '
{ process[$1] += $2 }
END {
  for (i in process) {
    printf("%-20s %s\n",i, process[i])
  }
}' | sort -nrk 2 | head

# Remove the temporary log file
rm -f $TMP_FILE 2> /dev/null

exit 0
