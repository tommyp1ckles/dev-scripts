#!/usr/bin/env bash

iface=
delay=

while getopts ":i:d:" name
do
    case $name in
    i)    iface="$OPTARG"
	  ;;
    d)    delay="$OPTARG"
	  ;;
    ?)   printf "Usage: %s: [-d delay] [-i interface] args\n" $0
	  exit 2;;
    esac
done

if [ -z "$iface" ]; then
    printf "Must specify iface (-i <name>)\n"
    exit 1
fi
if [ -z "$delay" ]; then
    printf "Must specify delay (-d <delay>)\n"
    exit 1
fi

printf "Setting delay for %s to %s\n" ${iface} ${delay}

# See: https://man7.org/linux/man-pages/man8/tc.8.html
# root: modify outbound traffic (egress qdisc).
# netem: provides network emulation/simulation functionality.
sudo tc qdisc add dev "${iface}" root netem delay "${delay}"

echo "Delay set, clear all by doing: 'sudo tc qdisc del dev ${iface} root'"
