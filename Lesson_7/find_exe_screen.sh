#!/bin/bash 

for file in $(find /usr/bin /usr/sbin -type f)
do
    if [ -x "$file" ]
    then
    echo "$file is an executable Linux file" >> executable.txt
    
    else
    echo "$file is NOT executable Linux file" >> executable.txt
   
    fi
done

for ((i = 0 ; i < 6 ; i++))
do
echo "Still running"
sleep 10
done