#!/bin/bash
./script5g&
while true
do
read line
if [[ $line == "QUIT" ]]
then 
echo "QUIT" >> pipe 
exit
fi
if [[ $line != "+" && $line != "*" && ! $line =` [0-9]+ ]]
then 
echo $line >> pipe 
exit 
fi
if [[ $line != '*' ]]
then 
echo $line >> pipe
else
echo "*" >> pipe
fi
done 