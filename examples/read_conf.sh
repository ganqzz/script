#!/bin/bash
typeset -A config  # synonym for 'declare'
config=(
  [username]="student"
  [password]=""
  [hostname]="ubuntu"
)

while read line
do
  if echo "$line" | grep -F = &>/dev/null
  then
    varname=$(echo "$line" | cut -d'=' -f1)
    config[$varname]=$(echo "$line" | cut -d'=' -f2-)
  fi
done << EOF
password=training
echo rm -rf /
PROMPT_COMMAND='ls -l'
hostname=ubuntu; echo rm -rf /
EOF

echo ${config[username]}
echo ${config[password]}
echo ${config[hostname]}
echo ${config[PROMPT_COMMAND]}
