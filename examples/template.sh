#!/bin/bash
#
# <Replace with the description and/or purpose of this shell script.>

SELF="$0"
RET=0

function_one() {
  local LOCAL_VAR1="one"
  # <Replace with function code.>
}

usage() {
  echo "Usage: ${SELF} <ARG1> [<ARG2> ...]"
  exit 1
}

# Main body of the shell script starts here.
#
# <Replace with the main commands of your shell script.>

main() {
  # ...
}

main

# Exit with an explicit exit status.
exit $RET
