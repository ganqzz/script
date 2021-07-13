#!/bin/bash
x=01
y=1
echo comparing x=$x and y=$y

if [[ $x == $y ]]  # prefer "==" to "="
then
  echo [[ x == y ]]
else
  echo Not [[ x == y ]]
fi

if [[ $x -eq $y ]]
then
  echo [[ x -eq y ]]
else
  echo Not [[ x -eq y ]]
fi

if ((x == y))
then
  echo '((x == y))'
else
  echo Not '((x == y))'
fi
