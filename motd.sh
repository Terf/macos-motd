#!/bin/bash

user=`whoami`
printf "Welcome, ${user}. It's currently "
date
./services.sh
./cpu.sh
echo "System:"
system_profiler SPSoftwareDataType | tail -n10 | cut -c 5-

