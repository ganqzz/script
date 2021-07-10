#!/bin/sh
# Filename: password.sh
echo -n "Enter password: "
stty -echo
read PASSWORD
stty echo
echo
echo Password $PASSWORD
