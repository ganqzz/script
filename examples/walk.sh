#!/bin/bash
# directory walk

shopt -s dotglob

walk() {
  for p in "$1"/*; do
    if [[ -d "$p" ]]; then
      echo "D: $p"
      walk "$p"    # recursive call
    elif [[ -f "$p" ]]; then
      echo "F: $p"
    fi
  done
}

echo Start: $1
walk "$1"
