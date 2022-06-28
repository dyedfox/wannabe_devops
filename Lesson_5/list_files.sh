#!/bin/bash 

#method 1 - найпростіший спосіб - це скористатися можливостям команди ls. -lSh - list, Sort, human-readable
echo "Довгий запис" >> sorted.txt
ls /var/log -lSh >> sorted.txt
echo "" >> sorted.txt
echo "Короткий запис" >> sorted.txt
ls /var/log -Sh >> sorted.txt

#method 2 - Виведення результату пошуку у заданому форматі (розділювач NULL), сортування по першому стовпчику k1, -z - розділювач NULL, n - числове сортування
find /var/log -type f -printf '%s\t%f\0' | sort -zn -k1 | while read -r -d '' size name; do echo "[$size] [$name]" >> sorted2.txt;
done

#method 3 
find /var/log -type f -print0 | xargs -0 wc -c | sort -nr >> sorted3.txt


#method 4
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