#!/bin/bash

IP_ADDR=$1
IFS=.

is_digit_0_255() {
  [[ $1 =~ ^[[:digit:]]{1,3}$ ]] && (($1 >= 0)) && (($1 <= 255))
}

if echo "$IP_ADDR" | {
  read octet1 octet2 octet3 octet4 extra;
  is_digit_0_255 $octet1 &&
    is_digit_0_255 $octet2 &&
    is_digit_0_255 $octet3 &&
    is_digit_0_255 $octet4 &&
    test -z "$extra";
  }
then
  echo "'$IP_ADDR' is valid"
else
  echo "'$IP_ADDR' is NOT valid"
fi
