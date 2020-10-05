#!/bin/bash
for pid in $(ps -A -o pid)
do
ppid=$(grep -E -h -s -i "ppid:\s+(.+)" /proc/"$pid"/status | grep -o "[0-9]\+")
sum_exec_runtime=$(grep -E -h -s -i "se\.sum_exec_runtime(.+)" /proc/"$pid"/sched | awk '{print $3}')
nr_switches=$(grep -E -h -s -i "nr_switches(.+):\s+(.+)" /proc/"$pid"/sched | awk '{print $3}')
if [ -z $ppid ]; then
ppid=0
fi
if [ -z $sum_exec_runtime ] || [ -z $nr_switches ]; then
ART=0
else
ART=$(echo $sum_exec_runtime $nr_switches | awk '{printf "%f",$1/$2}')
fi
echo "$pid $ppid $ART"
done | sort -n -k2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' > 4.txt