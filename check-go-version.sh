#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    echo "Please add $(args: [version]) in your pre-commit config"
    exit 1
fi

FILE=go.mod
if [ -f "$FILE" ]; then
  base_version=$1
  current_version=$(grep -w $FILE -e '^go [1-3].[1-9]*$' | awk -F' ' '{print $2}')
  check_version=$(awk -v b="${base_version}" -v c="${current_version}" 'BEGIN {if (b <= c) print "true"; else print "false"}')

  if [[ $check_version == "true" ]]; then
    echo "go version ${current_version} is OK"
  else
    echo "go version ${current_version} is minor to required ${base_version}"
    exit 1
  fi
else
    echo "$FILE does not exist."
fi

