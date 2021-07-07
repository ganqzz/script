#!/bin/bash

echo "Name?"
read name
echo "Password?"
read -s pass
read -p "Comment: " comm

read -ep"Color? " -i "White" color

echo "Name: $name"
echo "Password: $pass"
echo "Comment: $comm"
echo "Color: $color"
