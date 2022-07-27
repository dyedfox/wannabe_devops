#!/bin/bash 

# Виявив цікаву річ: серверна версія Убунту використовує gawk (awk -W version) (GNU awk), а декстопна - mawk, що є спрощеною версією awk і в якій не працює багато речей, наприклад {}. sudo apt install gawk перекриває mawk

# Пошук в результатах виводу echo
echo "ISBN 5-02-013850-9" | awk '/^ISBN [0-9]{1}-[0-9]{2}-[0-9]{6}-[Xx0-9]{1}$/ {print $0}'
#або
echo "ISBN 5-02-013850-9" | awk '/^ISBN\s[0-9]{1}-[0-9]{2}-[0-9]{6}-[Xx0-9]{1}$/ {print $0}'



# Пошук у файлі
awk '/^ISBN [0-9]{1}-[0-9]{2}-[0-9]{6}-[Xx0-9]{1}$/ {print $0}' isbn.txt
#або
awk '/^ISBN\s[0-9]{1}-[0-9]{2}-[0-9]{6}-[Xx0-9]{1}$/ {print $0}' isbn.txt