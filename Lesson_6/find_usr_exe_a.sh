#!/bin/bash 

# Варіант з масивом - для більш структурованого виводу інформації

declare -a files_exe
declare -a files_r


exec=0
read=0
n=0

for file in /usr/sbin/*
do
    if [ -x "$file" ]
    then
    files_exe[n]=$file
    ((exec++))
    ((n++)) 
    elif [ -r "$file" ]
    then
    files_r[n]=$file
    ((read++))
    ((n++))
    fi
done

echo "Виконуваних файлів: $exec"
echo "Файлів, що мають атрибут читання: $read"

echo "Executable: $exec" >> usr_executables.txt

for nn in ${files_exe[@]}
do
echo "[ $nn ] is executable Linux file" >> usr_executables.txt
done

echo "Readable: $read" >> usr_executables.txt

for y in ${files_r[@]}
do
echo "[ $y ] is readable Linux file" >> usr_executables.txt
done