#!/bin/bash 

#1. Перший варіант - перевіряємо файли, які мають обидва атрибути -r -x

for file in $(find /usr/sbin -type f)
do
    if [ -x "$file" ] && [ -r "$file" ]
    then
    echo $file >> usr_executables.txt
    fi
done


#Другий варіант - скористатися опціями команди find

find /usr/sbin -type f -perm -+r+x  >> usr_executables2.txt



# Третій варіант з масивами - для більш структурованого виводу інформації. Тут файли ділять на ті, що мають один атрибут і на ті, що мають інший

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

#echo "----  Executable ----: $exec" >> usr_executables.txt

for nn in ${files_exe[@]}
do
echo $nn >> usr_executables3.txt
done

#echo "----  Readable  ----: $read" >> usr_executables.txt

for y in ${files_r[@]}
do
echo $y >> usr_executables3.txt
done