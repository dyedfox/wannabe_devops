#!/bin/bash 

#ps aux | grep $item | tr -s ' ' | cut -d ' ' -f 2,11
#Put command output into string - result=`command` or result=$(command) both assign the output of command to the result variable.
#((...)) is an arithmetic statement, while $((...)) is an arithmetic expression. Без $(()) не працює у випадку відсутності результату команди pgrep, потрібно перетворювати на арифметичний вираз

item='apache2'

pid=$(pgrep -U root $item)
#pid=`pgrep -U root $item` - можна і так

#echo $pid

if [ $((pid)) -gt 0 ]
then
kill -15 $pid
#kill -18 $pid ????
echo "Process $item $pid stopped"
else
echo "There is no process $item"
fi