#!/bin/bash
./script6g&
while true
do
read line
case $line in
"TERM")
kill -SIGTERM $(cat 6pid)
exit
;;
"+")
kill -USR1 $(cat 6pid)
;;
"*")
kill -USR2 $(cat 6pid)
;;
esac
done