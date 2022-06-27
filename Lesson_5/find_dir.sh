#!/bin/bash 

dir=0

#всі вкладені директорії, для глибини пошуку можна застосувати аргумент -maxdepth 5, наприклад
for file in $(find /etc -type d)
do
    echo "$file" >> etc_dir.txt.txt
    ((dir++))

done
echo "Знайдено директорій: $dir"