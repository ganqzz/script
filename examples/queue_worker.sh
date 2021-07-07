#!/bin/bash
FIFO_FILE=/tmp/WORK_QUEUE

BUFFER=""
NAME="$1"

echo "$NAME started ($$)"

while true; do
  read BUFFER < "${FIFO_FILE}"
  if [ "${BUFFER}" != "" ]; then
    echo "$NAME received: $BUFFER"
    exit 1
  fi
done

exit 0
