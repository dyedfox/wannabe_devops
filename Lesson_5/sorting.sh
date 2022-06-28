#!/bin/bash 

#method 4

#files=$(find /var/log -type f -printf '%s\t%f\0')

IFS=$'\n'

files=$(ls /var/log -lSh)

#echo $files > sorted5.txt

for x in ${files[@]}
do

echo $x >> sorted4.txt

done