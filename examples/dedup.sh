#!/bin/bash
declare -a TABLE

search() {
  for e in "${TABLE[@]}"; do
    if [ "$1" == "$e" ]; then
      return 0  # found
    fi
  done

  return 1  # not found
}

dedup() {
  for file in "$1"/*; do
    [[ -f "$file" ]] || continue

    local code=$(sha1sum "$file" | cut -d' ' -f1)
    if search $code; then
      rm -f "$file"
      echo "'$file' has been deleted"
    else
      TABLE+=($code)
    fi
  done
}

dump() {
  for i in ${!TABLE[@]}; do
    echo "#$i: ${TABLE[$i]}"
  done
}

if [[ ! -d "$1" ]]; then
  echo "'$1' is not a directory"
  exit 1
fi

dedup "$1"

#dump
