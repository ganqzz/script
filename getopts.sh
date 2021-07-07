#!/bin/bash
# bash built-in

while getopts :u:p:ab opt; do
  case $opt in
    u) user=$OPTARG;;
    p) pass=$OPTARG;;
    a) echo "a";;
    b) echo "b";;
    ?) echo "Nothing $OPTARG";;
  esac
done

echo "User: $user / Pass: $pass"
