#!/bin/bash
ppid="0"
AWG="0"
count="0"
b=""
AVG="0"

echo -e "$(<4.txt)\n" | sed "s/[^0-9.]\+/ /g" | sed "s/^ //g" |
while read a;
do
pid=$(awk '{print $1}' <<< $a)
newPPID=$(awk '{print $2}' <<< $a)
newAWG=$(awk '{print $3}' <<< $a)
if [[ -z $newAWG ]]; then
newAWG=0
fi
if [[ $ppid == $newPPID ]];
then AWG=$(echo "$AWG+$newAWG" | bc | awk '{printf "%f", $0}')
echo "Average_Children_Running_Time_of_ParentID="$ppid" is "AVG
AWG=$newAWG
ppid=$newPPID
count=1
fi
if [[ ! -z $pid ]];
then echo "ProcessID="$pid" : Parent_ProcessID="$newPPID" : Average_Running_Time="$newAWG
fi
done > 5.txt