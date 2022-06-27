#!/bin/bash 

exec=0
notexec=0

#method 1 - всі вкладені директорії, для глибини пошуку можна застосувати аргумент -maxdepth 5, наприклад
for file in $(find /usr -type f)
do
    if [ -x "$file" ]
    then
    echo "$file is an executable Linux file" >> executable.txt
    ((exec++))
    else
    echo "$file is not executable Linux file" >> executable.txt
    ((notexec++))
    fi
done
echo "Виконуваних файлів: $exec"
echo "Інших файлів: $notexec"

#method 2 -  примітивний метод для конкретної директорії, із вказівкою глибини пошуку через /*
for file in /usr/bin/*
do
if [ -f "$file" ] 
then
    if [ -x "$file" ]
    then
    echo "$file is an executable Linux file" >> executable2.txt
    else
    echo "$file is not executable Linux file" >> executable2.txt
    fi
fi
done