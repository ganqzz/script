#!/bin/sh

OPTIONS=`getopt -n $(basename $0) -a -o 'ab:c::' -l 'aaa,bbb:,ccc::' -- "$@"`
eval set -- "$OPTIONS"

flag_a=false
flag_b=false
flag_c=false

while [ $# -gt 0 ]
do
  case $1 in
    -a | -aaa | --aaa)
      flag_a=true
      ;;
    -b | -bbb | --bbb)
      flag_b=true
      arg_b=$2; shift
      ;;
    -c | -ccc | --ccc)
      flag_c=true
      arg_c=$2; shift
      ;;
    --) shift; break;;
  esac
  shift
done

if $flag_a; then
  echo "-a on"
else
  echo "-a off"
fi

if $flag_b; then
  echo "-b on (arg=$arg_b)"
else
  echo "-b off"
fi

if $flag_c; then
  echo "-c on (arg=$arg_c)"
else
  echo "-c off"
fi

echo "*** Parameters"
while [ $# -gt 0 ]
do
  echo "param=$1"
  shift
done
