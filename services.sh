#!/bin/bash

# Declare array of services and pretty human readable names
declare -a services=(
"com.apple.Safari"
"com.google.Chrome"
"Spotify"
"com.docker"
)

declare -a serviceNames=(
"Safari"
"Chrome"
"Spotify"
"Docker"
)

declare -a serviceStatus=()

# Get status of all my services
for service in "${services[@]}"
do
	status=`launchctl list | grep "$service"`
	if [[ ! -z $status ]]; then
		serviceStatus+=("active")
	else
		serviceStatus+=("inactive")
	fi
done

# Maximum column width
#width=$((49-2))
width=90

# Current line and line length
line="  "
lineLen=0

echo ""
echo "Services running:"

for i in ${!serviceStatus[@]}
do
	# Next line and next line length
	next=" ${serviceNames[$i]}: \e[5m${serviceStatus[$i]}"
	nextLen=$((1+${#next}))

	# If the current line will exceed the max column with then echo the current line and start a new line
	if [[ $((lineLen+nextLen)) -gt width ]]; then
	printf "$line\n"
	lineLen=0
	line="  "
	fi

	lineLen=$((lineLen+nextLen))

	# Color the next line green if it's active, else red
	if [[ "${serviceStatus[$i]}" == "active" ]]; then
	line+="\e[32m\e[0m${serviceNames[$i]}: \e[32m● ${serviceStatus[$i]}\e[0m "
	else
	line+="${serviceNames[$i]}: \e[31m▲ ${serviceStatus[$i]}\e[0m "
	fi
done

# echo what is left
printf "$line\n"

