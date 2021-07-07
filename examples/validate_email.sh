#!/bin/bash

EMAIL="$1"
if echo "$EMAIL" | grep -qs '^[a-zA-Z0-9._]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*$'; then
  echo "'$EMAIL' is valid"
else
  echo "'$EMAIL' is NOT valid"
fi
