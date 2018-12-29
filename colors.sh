#!/bin/bash

# # for color in {0..255} ; do
# for color in {0..15} ; do
# 	# Display the color
# 	printf "\e[48;5;%sm  %3s  \e[0m" $color
# 	# Display 6 colors per lines
# 	if [ $((($color + 1) % 6)) == 4 ] ; then
# 		echo # New line
# 	fi
# done

echo
printf "   "
for color in {41..46} ; do
	# Display the color
	printf "\e[${color}m   "
done
printf "\e[0m"
echo
