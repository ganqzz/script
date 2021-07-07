#!/bin/bash
function glob_demo {
  for file in *.not_found; do
    echo $file
  done
}

echo "--- no nullglob ---"
shopt -u nullglob
glob_demo
echo "--- no nullglob end ---"
echo

echo "--- nullglob ---"
shopt -s nullglob
glob_demo
shopt -u nullglob
echo "--- nullglob end ---"
echo

echo "--- failglob ---"
shopt -s failglob
glob_demo
shopt -u failglob
echo "--- failglob end ---"
echo
