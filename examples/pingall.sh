#!/bin/bash
# Filename: pingall.sh
# Change base address 192.168.0 according to your network.

for ip in 192.168.0.{1..254}
do
  (
    ping $ip -c1 &> /dev/null
    [[ $? -eq 0 ]] && echo $ip is alive
  ) &
done
wait
