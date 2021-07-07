#!/bin/bash

VERBOSE=false  # /bin/false
PID=$$
PROGRAM_NAME="$0"
THIS_HOST=$(hostname)

logit() {
  local LOG_LEVEL=$1
  shift
  MSG=$@
  TIMESTAMP=$(date +"%Y-%m-%d %T")
  if [ $LOG_LEVEL = 'ERROR' ] || $VERBOSE
  then
    echo "${TIMESTAMP} ${THIS_HOST} ${PROGRAM_NAME}[${PID}]: ${LOG_LEVEL} ${MSG}"
  fi
}

logit INFO "Processing data."

false || logit ERROR "Could not fetch data from $HOST"
