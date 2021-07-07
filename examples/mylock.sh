#!/bin/bash
LOCKFILE="/tmp/example.lock"
TIMEOUT=5

function my_lock {
  local start_time cur_time
  start_time=$(date +%s)

  while true; do
    ln -s $$ "${LOCKFILE}" 2> /dev/null && return 0
    cur_time=$(date +%s)
    if ((cur_time - start_time > TIMEOUT)); then
      echo "ERROR: lock timeout" 1>&2
      return 1
    fi
    sleep 1
  done
}

function my_unlock {
  local exit_code=$?  # status at invoke time
  unlink "${LOCKFILE}" 2> /dev/null
  exit "${exit_code}"
}

echo My process ID is $$

my_lock || exit 1

trap  "my_unlock" EXIT HUP INT QUIT TERM

echo Start

# do something atomic
while true; do sleep 10; done
