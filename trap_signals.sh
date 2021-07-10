#/bin/sh
# Filename: trap_signals.sh
# Description: Signal handler

# Signal handlers
int_handler() {
  echo Hey, received signal SIGINT
  exit
}

term_handler() {
  echo SIGTERM received but do not exit
}

quit_handler() {
  trap 'echo more SIGQUIT' SIGQUIT
}

# $$ is a special variable that returns process ID of current process/script
echo My process ID is $$

# trap signals
trap 'int_handler' SIGINT
trap 'quit_handler' SIGQUIT
trap 'term_handler' SIGTERM
trap 'echo Killed by SIGKILL' SIGKILL  # cannot trap SIGKILL

# handler is the name of the signal handler function for SIGINT signal
n=0
while :
do
  sleep 5
  echo $((++n))
done
