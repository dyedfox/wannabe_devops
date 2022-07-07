#!/bin/bash 

exec=0
read=0

for file in $(find /usr/sbin -type f)
do
    if [ -x "$file" ]
    then
    echo "$file is an executable Linux file" >> usr_executables.txt
    ((exec++))
    elif [ -r "$file" ]
    then
    echo "$file is readable Linux file" >> usr_executables.txt
    ((read++))
    fi
done
echo "Виконуваних файлів: $exec"
echo "Файлів, що мають атрибут читання: $read"