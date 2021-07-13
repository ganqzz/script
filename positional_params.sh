#!/bin/sh

arg1="a b"
arg2=cd

# edit positional parameters
set -- "$arg1" "$arg2"

echo '$#': $#
echo \$1: $1
echo \$2: $2

# expand parameters
echo --- '$@'
for p in $@; do
  echo $p
done

echo --- '$*'
for p in $*; do
  echo $p
done

echo --- '"$@"'
for p in "$@"; do
  echo $p
done

echo --- '"$*"'
for p in "$*"; do
  echo $p
done
