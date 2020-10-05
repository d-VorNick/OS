#!/bin/bash
grep "VmRSS" /proc/*/status | sort -rnk2 | head -n1 | sed "s/[^0-9]\+/ /g" | awk '{print "PID= "$1 " MEMORY= "$2}'
echo "TOP result"
top -o %MEM | head -8 | tail -n +8