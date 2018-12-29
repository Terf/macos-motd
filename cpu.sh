#!/bin/bash

usage=`ps -A -o %cpu | awk '{s+=$1} END {print s}'`
pct=`bc -l <<< "${usage}/400"` # 400 because 4 cores on my machine
printf "CPU usage: "
printf %.2f `echo "${pct}*100" | bc -l`
echo "%"
bar="================================================="
# red='\033[0;31m'
red='\e[33m'
nc='\033[0m'
count=${#bar}
index=`bc -l <<< "${pct} * ${count}"`
index=`printf "%.0f" "${index}"`
printf "  [${red}${bar:0:$index}${nc}${bar:$index:$count}]\n"

