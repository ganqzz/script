#!/bin/bash
x=01
y=1
echo comparing $x and $y

if [[ $x == $y ]]  # prefer "==" to "="
then
  echo ==
else
  echo not ==
fi

if [[ $x -eq $y ]]
then
  echo eq
else
  echo not eq
fi

if ((x==y)) # space is no matter
then
  echo '(())' ==
else
  echo not '(())' ==
fi
