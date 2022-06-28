#!/bin/bash 

#method 4

#files=$(find /var/log -type f -printf '%s\t%f\0')

IFS=$'\n'

files=$(ls /var/log -lSh)

#echo $files > sorted5.txt

for x in ${files[@]}
do
    IFS=$'\s'
    for xx in ${x[@]}
    do
    echo $xx >> sorted5.txt
    done

echo $x >> sorted4.txt

done