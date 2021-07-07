#!/bin/bash
FIFO_FILE=/tmp/WORK_QUEUE
mkfifo "${FIFO_FILE}"

NUM_WORKERS=5

for ((i = 0; i < NUM_WORKERS; i++)); do
  bash queue_worker.sh "Worker_$i" &
done

sleep 1

for ((i = 0; i < NUM_WORKERS; i++)); do
  echo "Henlo $i!" > "${FIFO_FILE}"
done

sleep 1
rm -f "${FIFO_FILE}"

exit 0
