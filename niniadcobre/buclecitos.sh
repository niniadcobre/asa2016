#!/bin/bash 
# Scrip para crear archivos con Zero. Cantidad y Tamaño ingresado como argumento.
############# funciones #############
# creo particiones msdos
function particiono {
    parted -s $Dev mklabel $TipoLabel
    parted -s $Dev mkpart primary $TipoFS 0 100% set 1 raid on >/dev/null  2>&1 
}

# Verifico si soy Root
function quiensoy {
if [[ `id -u` -ne 0 ]];then 
	printf "Ud debe ser root para ejecutar este programa\n"
	exit 1
fi 
}

############# Main #############
quiensoy  #llamo para verificar si soy Root
if [[ $# -ne 2 ]];then 
	printf "Formato: $0 <cant dispositivos> <Tamaño en MiB>\n"
	exit 1
fi

cant=$1
tam=$2
#
# Pregunto como quiero crear las particiones msdos - gpt y tipo ext2 al ext4
printf "Tipo de Partición (msdos - gpt): \n"; read TipoLabel
case $TipoLabel in
   msdos|MSDOS)  TipoLabel=msdos;;
   gpt|GPT) TipoLabel=gpt;;
   *)  echo "No reconosco el tipo $TipoLabel!!"; exit 1;;
esac 

printf "Sistema de archivo (ext2, ext3, ext4): \n"; read TipoFS
case $TipoFS in
   ext2|EXT2)  Tipo=ext2;;
   ext3|EXT3)  Tipo=ext3;;
   ext4|EXT4)  Tipo=ext4;;
   *)  echo "No reconosco el tipo $TipoFS!!"; exit 1;;
esac
#
# Inicio la creación de los loopdevice!!
#
for ((i=0;i < $cant;i++));do 
    Disco=disco$RANDOM 
    dd if=/dev/zero of=$Disco bs=1M count=$tam >/dev/null  2>&1 
    Dev=`losetup --find --show $Disco`
    particiono # llamo a la función de particionado
    printf "Dispositivo $Dev creado y particionado en $TipoLabel\n"
done

