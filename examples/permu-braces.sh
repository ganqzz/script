#!/bin/bash

input=${1:-hoge}

printbraces() {
  local var='{'
  local end=$((${#line} - 1))
  for (( i = 0; i < ${#line}; i++ )); do
    var+="${line:$i:1},"
  done
  var="${var%,*}}"
  printf "${var}%.0s" $(seq 1 ${#line})
}

for line in $(echo $input); do
  eval echo $(printbraces "$line")
done
