#!/bin/bash

# bash can omit the read command argument (default: REPLY)
read -p "Enter (yes/no) or (yY/nN): "

case "$REPLY" in
  [yY]|[yY][eE][sS])
    echo "You answered yes."
    ;;
  [nN]|[nN][oO])
    echo "You answered no."
    ;;
  *)
    echo "Invalid answer."
esac

# fall through
read -p "Enter 1 or 2 or 3: "

case "$REPLY" in
  1)
    echo "One"
    ;&
  2)
    echo "Two"
    ;&
  3)
    echo "Three"
esac
