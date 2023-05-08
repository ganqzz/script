#!/bin/bash

echo -e "hoge\nfuga" | (read first; read second; echo -e "First: $first\nSecond: $second")
echo '---'

echo "Name?"
read name

# suppress echo back
echo "Password?"
read -s pass

# prompt
read -p "Comment: " comm

# array
read -p "Tags: " -a tags

# initial data
# -e: using gnu readline library
read -ep"Color? " -i "White" color

echo
echo "Name: $name"
echo "Password: $pass"
echo "Comment: $comm"
echo "Tags: ${tags[@]}"
echo "Color: $color"
