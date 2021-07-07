#!/bin/bash

# This is a startup script for dummy-daemon

case "$1" in
  start)
    ./dummy-daemon &
    ;;
  stop)
    kill $(cat /tmp/dummy-daemon.pid)
    ;;
  *)
    echo "Usage: $0 start|stop"
    exit 1
esac
