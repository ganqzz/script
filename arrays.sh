#!/bin/bash

echo --- Indexed array ---

a=()
b=("apple" "banana" "cherry" "water melon")
echo $b  # first element indexed by 0
echo ${b[0]}
echo ${b[1]}
echo ${b[2]}
echo ${b[3]}

b[5]="kiwi"
echo ${b[5]}
echo ${b[4]}  # empty
echo ${#b}
echo ${!b[@]}  # indices

b+=("mango")
echo ${b[@]}
echo ${b[@]: -2}  # slice: param_expansion.sh参照
echo ${b[6]}
echo ${b[7]}
echo ${#b}

# iteration
for e in "${b[@]}"; do  # skip empty value
  echo $e
done

for i in ${!b[@]}; do  # by index
  echo "$i: ${b[$i]}"
done

echo
echo --- Associative array ---
declare -A assoc
assoc=(["apple"]='$100' [orange]='$150')
assoc[cherry]='$200'
assoc[water melon]='$1000'
echo ${assoc["orange"]}
echo ${assoc[@]}  # values
echo ${!assoc[@]}  # keys

# iteration
for k in "${!assoc[@]}"; do  # quotation
  echo "$k: ${assoc[$k]}"
done
