#!/bin/bash

[[ "abcde" =~ (b)(.)(d)e ]]
echo $?
echo "${BASH_REMATCH[0]}"
echo "${BASH_REMATCH[1]}"
echo "${BASH_REMATCH[2]}"
echo "${BASH_REMATCH[3]}"
echo "${BASH_REMATCH[4]}"

[[ "abc" =~ xyz ]]
echo $?
