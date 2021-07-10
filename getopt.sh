#!/bin/sh

main() {
  OPT=`getopt -o ab:c:: -l long:: -- "$@"`
  [ $? -ne 0 ] && exit 1

  eval set -- "$OPT"

  while :
  do
    case "$1" in
      -a) shift;;
      -b) echo "$2"; shift 2;; # : required
      -c) echo "$2"; shift 2;; # :: optional
      --long) echo "$2"; shift 2;;
      --) shift; break;;
      *)
        echo "Internal error!" >&2
        exit 1;;
    esac
  done
}

main
echo $OPT
main -a hoge
echo $OPT
main -a -b hoge -c fuga fefe
echo $OPT
main -a -b hoge -cfuga fefe
echo $OPT
main --long fefe awawa  # longとoptionalは相性良くない
echo $OPT
