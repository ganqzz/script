#!/bin/bash

input=${1:-hoge}

perm() {
  local items="$1"
  local out="$2"
  local i
  [[ "$items" == "" ]] && echo "$out" && return
  for (( i = 0; i < ${#items}; i++ )); do
    perm "${items:0:i}${items:i+1}" "$out${items:i:1}"
  done
}

while read line; do
  perm $line
done < <(echo $input)
