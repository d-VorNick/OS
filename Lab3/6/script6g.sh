#!/bin/bash
echo $$ > 6pid
result=1
d="+"
s()
{
exit
}
user1()
{
d="+"
}
user2()
{
d="*"
}
trap 's' SIGTERM
trap 'user1' USR1
trap 'user2' USR2
while true
do
case $d in
"+")
let result=$result+2
;;
"*")
let result=$result*2
;;
esac
echo $result
sleep 1
done