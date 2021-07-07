#!/bin/bash
CURRENT_LVL=0

indent() {
  local x=0
  local tabs=".."
  while ((x < $1)); do
    tabs+=".."
    ((x++))
  done
  echo -en "$tabs"
}

recursive_tree() {
  for node in "$1"/*; do
    local leader=$(indent $CURRENT_LVL)
    local bn_node=$(basename "$node")
    if [[ -d "$node" ]]; then
      printf "%s|_ %s/\n" "$leader" "$bn_node"
      ((CURRENT_LVL++))
      recursive_tree "$node"
      ((CURRENT_LVL--))
    elif [[ -f "$node" ]]; then
      printf "%s|_ %s\n" "$leader" "$bn_node"
    fi
  done
}

recursive_tree "$1"
