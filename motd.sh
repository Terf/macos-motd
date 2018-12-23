#!/bin/bash

user=`whoami`
printf "Welcome, ${user}. It's currently "
date
/Users/tim/myrepos/macos-motd/services.sh
/Users/tim/myrepos/macos-motd/cpu.sh
echo "System:"
system_profiler SPSoftwareDataType | tail -n10 | cut -c 5-

