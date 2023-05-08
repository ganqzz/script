#!/bin/bash

echo --- Indexed array ---
declare -a a

b=("apple" "banana" "cherry" "water melon")
echo $b  # first element indexed by 0
echo ${b[0]}
echo ${b[1]}
echo ${b[2]}
echo ${b[3]}
echo ${#b[@]}

b[5]="kiwi"
echo ${b[5]}
echo ${b[4]}  # empty
echo ${#b[@]}
echo ${!b[@]}  # indices

b+=("mango")
echo ${b[6]}
echo ${b[@]}
echo ${b[@]: -2}  # slice: param_expansion.sh参照
echo ${#b[@]}

echo
unset b[1]  # unset an element
echo ${b[@]}
echo ${#b[@]}

# iteration
echo
for e in "${b[@]}"; do  # skip empty value
  echo $e
done

echo
# not properly work if it's uncontiguous
for ((i = 0; i < ${#b[@]}; i++)); do
  echo "$i: ${b[i]}"  # index can be with or without "$" sign
done

echo
for i in ${!b[@]}; do  # by index
  echo "$i: ${b[i]}"
done

# copy
echo
c=("${b[@]}")  # quotation

unset b  # unset entire array

# reindexed at copying (skipped empty value)
for i in ${!c[@]}; do
  echo "$i: ${c[i]}"
done

echo
echo --- Associative array ---
declare -A assoc
assoc=(["apple"]='$100' [orange]='$150')
assoc+=([cherry]='$200')
assoc[water melon]='$1000'
echo ${assoc["orange"]}
echo ${!assoc[@]}  # keys
echo ${assoc[@]}  # values

# iteration
for k in "${!assoc[@]}"; do  # quotation
  echo "$k: ${assoc[$k]}"  # key must be with "$" sign
done
