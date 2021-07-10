#!/bin/sh
# replace the current shell's output redirection

LOGFILE=/tmp/test_log.$$

cp -f /dev/null "$LOGFILE"
exec > "$LOGFILE" 2>&1

echo "##  `date` started."

(
# sub shell
echo "    1. from sub shell"
exec > /dev/null
echo "    2. from sub shell"
)

echo "##  `date` finished."
