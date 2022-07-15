#!/bin/bash 

item='apache2'

pid=$(pgrep -U root $item)

if [ $((pid)) -gt 0 ]
then
kill -18 $pid
for ((i = 0 ; i < 6 ; i++))
do
echo "Process $item $pid suspended $i"
sleep 5
done
else
echo "There is no process $item"
fi