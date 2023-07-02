#!/bin/bash

if [ "$1" == "-mac" ]; then
    ip link show | awk '/ether/ {print $2}'
elif [ "$1" == "-private" ]; then
    ip addr show | awk '/inet (192\.168|10\.|172\.(1[6-9]|2[0-9]|3[01]))\./ {split($2, a, "/"); print a[1]}'
elif [ "$1" == "-public" ]; then
    dig +short myip.opendns.com @resolver1.opendns.com
else
    ip addr show
	echo Public IP Address: 
	dig +short myip.opendns.com @resolver1.opendns.com

fi
