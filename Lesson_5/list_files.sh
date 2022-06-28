#!/bin/bash 

#МЕТОД 1 - найпростіший спосіб - це скористатися можливостями команди ls. -lSh - list, Sort, human-readable
echo "Довгий запис" >> sorted.txt
ls /var/log -lSh >> sorted.txt
echo "" >> sorted.txt
echo "Короткий запис" >> sorted.txt
ls /var/log -Sh >> sorted.txt

#МЕТОД 2 - Отримання результату пошуку командою find (-f - файли, '%s\t%f\0': %s - вибір текстової частини, %f - число, \t - таб, \0 - роздільник NULL) | сортування: -z - роздільник NULL, -n - числове сортування, -k1 - по першому стовпчику | порядкове перебирання результатів, розділення їх по нульовому роздільнику на розмір та назву і виведення у файл з результатом
find /var/log -type f -printf '%s\t%f\0' | sort -zn -k1 | while read -r -d '' size name; do echo "[$size] [$name]" >> sorted2.txt;
done

#МЕТОД 3 
find /var/log -type f -print0 | xargs -0 wc -c | sort -nr >> sorted3.txt


#МЕТОД 4 - Отримання у масив результатів виконання команди ls (попередньо посортованих) і виведення порядково у файл з нумерацією.
IFS=$'\n'

files=$(ls /var/log -lSh)

n=0

for x in ${files[@]}
do
if [ $n -lt 1 ] #відступи від []!!!!
then
echo $x >> sorted4.txt #Друк підсумку без номера. Або можна взагалі перший рядок-підсумок пропустити
else
echo "$n. $x" >> sorted4.txt
fi
((n++))
done