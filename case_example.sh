#!/bin/bash

read -p "Enter (yes/no) or (yY/nN): " ANSWER

case "$ANSWER" in
  [yY]|[yY][eE][sS])
    echo "You answered yes."
    ;;
  [nN]|[nN][oO])
    echo "You answered no."
    ;;
  *)
    echo "Invalid answer."
esac

case "$ANSWER" in
  [yY]*)
    echo "You answered yes."
    ;;
  *)
    echo "You answered something else."
esac

# fall through
read -p "Enter 1 or 2 or 3: " ANSWER

case "$ANSWER" in
  1)
    echo "One"
    ;&
  2)
    echo "Two"
    ;&
  3)
    echo "Three"
esac
