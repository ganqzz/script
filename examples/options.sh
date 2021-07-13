#! /bin/bash
# long options (--aaa,--bbb,-ccc)

flag_a=false
flag_b=false
flag_c=false
arg_a=
arg_b=
arg_c=
opterr=false
declare -a params

usage() {
  echo "USAGE:"
  echo " --aaa"
  echo " --bbb=ARG"
  echo " --ccc=[ARG]"
  exit 1
}

while [ $# -gt 0 ]
do
  case $1 in
    --bbb=*) flag_b=true; arg_b="${1#--bbb=}";;
    --ccc=*) flag_c=true; arg_c="${1#--ccc=}";;
    --aaa)
      flag_a=true
      ;;
    --bbb)
      flag_b=true
      if [ "${2::1}" != "-" ]; then
        arg_b=$2; shift
      fi
      ;;
    --ccc)
      flag_c=true
      if [ "${2::1}" != "-" ]; then
        arg_c=$2; shift
      fi
      ;;
    --) shift; break;;  # parameters splitter
    -*) opterr=true; echo "Unknown option: $1";;
    *)  params+=("$1");;
  esac
  shift
done

# error check
if $flag_b && [[ -z $arg_b ]]; then
  echo "--bbb requires an argument"
  opterr=true
fi

if $opterr; then
  usage
fi

# save parameters
while [ $# -gt 0 ]
do
  params+=("$1")
  shift
done

# options
if $flag_a; then
  echo "--aaa on"
else
  echo "--aaa off"
fi

if $flag_b; then
  echo "--bbb on (arg=$arg_b)"
else
  echo "--bbb off"
fi

if $flag_c; then
  echo "--ccc on (arg=$arg_c)"
else
  echo "--ccc off"
fi

# display parameters
for ((i = 0; i < ${#params[@]}; i++))
do
  echo "param=${params[i]}"
done
