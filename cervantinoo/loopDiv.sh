#!/bin/bash

if [[ `id -u` -ne 0 ]];then
	printf "Ud debe ser root para ejecutar este programa\n"

	exit 1
fi

for ((i=0; i < 5; i++));do
 	parted /dev/loop$i mklabel msdos mkpart primaria fat32 1 10
	hexdump -c /dev/loop$i
done

 for ((i=0; i < 5; i++));do
	 dd if=/dev/loop$i of=loop$i.img bs=1M count=10
 done



 for ((i=0; i < 5; i++));do
 	dd if=/dev/zero of=/dev/loop$i bs=1024 count=1024
 	hexdump -c /dev/loop$i
done

 for ((i=0; i < 5; i++));do
	dd if=loop$i.img of=/dev/loop$i
	hexdump -c /dev/loop$i
 done

#Fin del Script
