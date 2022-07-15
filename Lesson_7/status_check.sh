#!/bin/bash 


#Працюю в справжньому Ubuntu. Помітив таку штуку: якщо запускати сервіс через systemctl, то служба буде перезапускати apache2 знову після того, як він отримує kill -9. Якщо ж apache2 запускати через sudo service apache2 start, тоді скрипт завершує процес. Коректніше було б зупиняти службу, але, оскільки, завдання було для розуміння - то цей скрипт правильний

item='apache2'

pid=$(pgrep -U root $item)


if [ $((pid)) -gt 0 ]
then
kill -15 $pid
echo "Process $item $pid stopped"
else
echo "There is no process $item"
fi

echo "Waiting ... (10 seconds)"
sleep 10
pid=$(pgrep -U root $item)
if [ $((pid)) -gt 0 ]
then
kill -9 $pid
echo "Process $item $pid killed"
fi

