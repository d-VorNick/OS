#!/bin/bash
for pid in $(ps -A -o pid | tail -n +2)
do
command=$(grep -E -h -s -i "[A-Za-z0-9_]" /proc/"$pid"/comm)
mem=$(grep -E -h -s -i "read_bytes:" /proc/"$pid"/io | grep -o "[0-9]\+")
echo $pid" "$mem" "$command
done > 71.txt
sleep 1m

for pid in $(ps -A -o pid | tail -n +2)
do
command=$(grep -E -h -s -i "[A-Za-z0-9_]" /proc/"$pid"/comm)
mem=$(grep -E -h -s -i "read_bytes:" /proc/"$pid"/io | grep -o "[0-9]\+")
echo $pid" "$mem" "$command
done > 72.txt

while read a
do
pid=$(awk '{print $1}' <<< $a)
memory1=$(awk '{print $2}' <<< $a)
command=$(awk '{print $3}' <<< $a)
memory2=$(cat 72.txt | awk -v pid1="$pid" '{if ($1 == pid1) print $2}')
if [[ -z $memory ]]
memory=$(echo "$memory2-$memory1" | bc)
echo $pid":"$command":"$memory
fi
done | sort -t ':' -rnk3 | head -3