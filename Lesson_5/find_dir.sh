#!/bin/bash 

#Метод 1

dir=0

#всі вкладені директорії, для глибини пошуку можна застосувати аргумент -maxdepth 5, наприклад
for file in $(find /etc -type d)
do
    echo $file >> etc_dir.txt
    ((dir++))

done
echo "Знайдено директорій: $dir"


#Метод 2, глибину пошуку можна регулювати *

for file in /etc/*
do
if [ -d "$file" ] 
then
echo $file >> etc_dir2.txt
fi
done