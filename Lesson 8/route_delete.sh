#!/bin/bash 

#Вилучення маршрутів для поточного інтерфейса
ip route del 212.100.54.64/26 via 212.100.54.65 dev eth0
ip route del 212.100.54.128/26 via 212.100.54.129 dev eth0
ip route del 212.100.54.192/26 via 212.100.54.193 dev eth0

# Другий варіант запису через команду route
route del -net 212.100.54.64 netmask 255.255.255.192 gw 212.100.54.65 dev eth0
route del -net 212.100.54.128 netmask 255.255.255.192 gw 212.100.54.129 dev eth0
route del -net 212.100.54.192 netmask 255.255.255.192 gw 212.100.54.193 dev eth0