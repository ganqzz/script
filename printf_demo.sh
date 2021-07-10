#!/bin/bash

# str
printf "%10s|\n" ABCDEF
printf "%-10s|\n" ABCDEF

# int
int=123
printf "%d|\n" $int
printf "%5d|\n" $int
printf "%-5d|\n" $int
printf "%05d|\n" $int

# float
float=5.5555555
printf "%f|\n" ${float}
printf "%.4f|\n" ${float}
printf "%10f|\n" ${float}
printf "%010f|\n" ${float}
printf "%-10f|\n" ${float}

echo

# strftime(3)
printf "%(%Y-%m-%d %H:%M:%S)T\n" 1122334455
printf "%(%Y-%m-%d %H:%M:%S)T\n" $(date +%s)
printf "%()T\n"

echo

printf '%.0s-' {1..20}; printf "\n"

text="Hello World!"
length=$(wc -c <<< "$text")

printf "Char Hex\n"

for ((i = 0; i < length; i++)); do
  printf "%-4s 0x%-2X\n" "${text:$i:1}" "'${text:$i:1}"  # single quote: convert char to number
done
