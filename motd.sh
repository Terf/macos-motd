#!/bin/bash

user=`whoami`
date=`date`
printf "Welcome, ${user}. It's currently ${date}"
/Users/tim/myrepos/macos-motd/services.sh
/Users/tim/myrepos/macos-motd/cpu.sh
/Users/tim/myrepos/macos-motd/colors.sh
cat /Users/tim/myrepos/macos-motd/apple.txt | lolcat
#echo "System:"
# system_profiler SPSoftwareDataType | tail -n10 | cut -c 5- | lolcat
echo

