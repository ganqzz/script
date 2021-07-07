#!/bin/bash

PS3="Select: "
select opt in "a" "b" "quit"; do
  case $REPLY in
    1) echo "$opt";;
    2) echo "$opt";;
    3) echo "$opt"; break;;
    *) echo "Nothing";;
  esac
done
