#!/bin/bash

name=($(lsblk |grep disk|awk '{print $1}'))
printf '{'
printf '"data":['
for key in ${!name[@]}
do
if [[ "${#name[@]}" -gt 1 && "${key}" -ne "$((${#name[@]}-1))" ]];then
printf '{'
printf "\"{#DISK_NAME}\":\"${name[${key}]}\"},"
else [[ "${key}" -eq "((${#name[@]}-1))" ]]
printf '{'
printf "\"{#DISK_NAME}\":\"${name[${key}]}\"}"
fi
done
printf ']'
printf '}\n'
