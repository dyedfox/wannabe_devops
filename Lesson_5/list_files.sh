#!/bin/bash 
#method 1 - найпростіший спосіб - це скористатися можливостям команди ls
echo "Довгий запис" > sorted.txt
ls /var/log -lSh >> sorted.txt
echo "" >> sorted.txt
echo "Короткий запис" >> sorted.txt
ls /var/log -Sh >> sorted.txt

#method 2
#find . /var/log -type f -printf '%s\t%f\0' | 
 # sort -zn -k1,1 |
  #  while read -r -d '' size name; do echo "[$size] [$name]" >> sorted2.txt
   # done

#method 3 
find . /var/log -type f -print0 | xargs -0 wc -c | sort -nr > sorted3.txt