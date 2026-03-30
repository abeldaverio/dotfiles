#!/usr/bin/env sh

line=$(cat $(dirname $0)/current.txt | grep "^[[:space:]]*$1=")
cleared=$(echo ${line%%#*} | xargs)
IFS='='
read -ra array <<< $cleared
if [ ${#array[@]} -ne 2 ]; then
    echo "#ff0000"
fi
echo ${array[1]}
