#!/bin/bash

parts() {
  echo -n " $1"
  echo -ne "\r"
  toggle=$2
}

spin() {
  case $toggle in
    1) parts '\' 2;;
    2) parts '|' 3;;
    3) parts '/' 4;;
    *) parts '-' 1;;
  esac
}

for ((i = 0; i < 20; i++)); do
  spin
  sleep .2
done

echo Done!
