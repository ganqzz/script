#!/bin/bash
function glob_demo {
  for file in /tmp/*.glob_test; do
    echo $file
  done
}

echo "--- no nullglob ---"
shopt -u nullglob
glob_demo
echo "--- no nullglob end ---"
echo

echo "--- set nullglob ---"
shopt -s nullglob
glob_demo
shopt -u nullglob
echo "--- set nullglob end ---"
echo

echo "--- set failglob ---"
shopt -s failglob
glob_demo
shopt -u failglob
echo "--- set failglob end ---"
echo
