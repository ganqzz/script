#!/bin/bash
# for-loop and range demo

for i in dog cat hotdog
do
  echo i is $i
done

for i in `seq 3 5`
do
  echo i in seq is $i
done

for i in {3..5}  # brace expansion
do
  echo i in number list is $i
done

for i in {1..10..2}
do
  echo $i
done

for i in {A..P..2}
do
  echo i in letter list is $i
done

for d in $(</etc/hosts)
do
  echo d in file is $d
done

for f in $(find /etc 2>/dev/null | grep grub)
do
  echo grub named things are $f
done

max=10
for ((i = 0; i < max; i++))
do
  echo $i
done
