#!/bin/bash

data=$(ps -ly)

echo === Input data "(ps -ly)" ===
echo "$data"

echo -e "\n=== by while loop ==="
n=1
while read c1 c2 c3 c4 c5 c6 c7 c8 c9 c10
do
  if ((n > 1)); then
    ((rss += c8))
    ((sz += c9))
  fi
  ((n++))
done < <(echo "$data")
printf "RSS\tSZ\n%d\t%d\n" $rss $sz

echo -e "\n=== by awk ==="
echo "$data" | awk '
{ rssum+=$8; szsum+=$9 }
END { printf("RSS\tSZ\n%d\t%d\n", rssum, szsum) }
'
