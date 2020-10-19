#!/bin/bash
result=1
d='+'
tail -f pipe | while true
do
read line
case $line in
'+')
d='+'
;;
\*)
d='*'
;;
[0-9]*)
if [[ $d == '+' ]]
then
tmp=$result
let result=$result+$line
else
tmp=$result
let result=$result\*$line
fi
echo "$tmp$d$line = $result"
;;
"QUIT")
killall tail
rm pipe
exit
;;
*)
echo "Error!"
killall tail
rm pipe
exit
;;
esac
done