#!/bin/bash
SUBPID=0

func_timer() {
  trap "clean_up" SIGALRM
  sleep $1 & wait
  kill -s SIGALRM $$ 2> /dev/null
}

clean_up() {
  trap - SIGALRM
  kill -s SIGALRM $SUBPID 2> /dev/null
  kill $! 2> /dev/null
}

[[ $# -gt 1 && $1 =~ ^[[:digit:]]+$ ]] || exit 1

func_timer $1 & SUBPID=$!

shift

trap "clean_up" SIGALRM SIGINT

"$@" & wait $!

kill -ALRM $SUBPID 2> /dev/null
wait $SUBPID

exit 0
