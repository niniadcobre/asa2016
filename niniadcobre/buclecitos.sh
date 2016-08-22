#!/bin/bash 

if [[ `id -u` -ne 0 ]];then 
	printf "Ud debe ser root para ejecutar este programa\n"
	exit 1
fi 

if [[ $# -ne 2 ]];then 
	printf "Formato: $0 <cant dispositivos> <Tamaño en MiB>"
	exit 1
fi

cant=$1
tam=$2


for ((i=0;i < $cant;i++));do 
    disco=disco$RANDOM 
    dd if=/dev/zero of=$disco bs=1M count=$tam >/dev/null  2>&1 
    losetup --find --show $disco
done 
