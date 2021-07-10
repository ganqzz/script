#!/bin/sh
c="ls -s | sort -n"
$c
echo
eval $c
