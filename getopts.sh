#!/bin/bash
# bash built-in "getopt" command only for short options

while getopts :u:p:ab opt; do
  case $opt in
    u) user=$OPTARG;;
    p) pass=$OPTARG;;
    a) echo Option a;;
    b) echo Option b;;
    :) echo "Option '-$OPTARG' requires an argument!" >&2;;
    \?) echo "What is '-$OPTARG' option?" >&2;;
  esac
done

echo "User: $user / Pass: $pass"
