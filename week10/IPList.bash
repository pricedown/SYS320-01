#!/usr/bin/env bash


# List all of the ips in the given network prefix


[ $# -lt 1 ] && echo "Usage: $0 <Prefix>" && exit 1
prefix=$1

[ ${#prefix} -lt 5 ] && \
	printf "Prefix length is too short\nExample: 10.0.17\n" && \
	exit 1

for i in {1..255} 
do
	ip="$prefix.$i"
	ping -c 1 $ip | grep "64 bytes from $ip" | grep -o $ip
done
