#!/bin/bash
# Filename: ping.sh
# Change base address 192.168.0 according to your network.

for ip in 192.168.0.{1..254}
do
  (
    ping $ip -c 2 &> /dev/null
    [ $? -eq 0 ] && echo $ip is alive
  ) &
done
wait
