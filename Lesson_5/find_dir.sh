#!/bin/bash 

#МЕТОД 1

dir=0

#всі вкладені директорії, для глибини пошуку можна застосувати аргумент -maxdepth 5, наприклад
for file in $(find /etc -type d)
do
    echo $file >> etc_dir.txt
    ((dir++))

done
echo "Знайдено директорій: $dir"


#МЕТОД 2, глибину пошуку можна регулювати зірочкою /*

for file in /etc/*
do
if [ -d "$file" ] 
then
echo $file >> etc_dir2.txt
fi
done