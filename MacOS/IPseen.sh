#!/bin/bash

if [ "$1" == "-mac" ]; then
    ifconfig | awk '/ether/ {print $2}'
elif [ "$1" == "-private" ]; then
    ifconfig | awk '/inet (192\.168|10\.|172\.(1[6-9]|2[0-9]|3[01]))\./ {print $2}'
elif [ "$1" == "-public" ]; then
    curl -s https://ifconfig.me
else
    ifconfig -a
	echo Public IP Address: 
	curl -s https://ifconfig.me
fi
