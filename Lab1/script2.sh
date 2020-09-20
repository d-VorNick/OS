#!/bin/bash
a=""
read b
while [[ "$b" != "q" ]]
do
a="$a$b"
read b
done
echo "$a"
