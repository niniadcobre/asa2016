#!/bin/bash
# Script para verificar el tamaño de los 5 directorios mas grande.
#
# inicialiso variables
DirTem=/tmp/$((RANDOM))
#
# Main #
dpkg -l | grep zenity &> /dev/null
if [ "$?" != "0" ] ; then
  echo "No Puedo ejecutarme, por falta de zenity.... Instale y vuelva a ejecutar!!"
  exit 1
fi
mkdir $DirTem
for i in `ls -d $HOME/*/` ; do
  du -sh $i >> $DirTem/tmp.cl5
done
cat $DirTem/tmp.cl5 | sort -r -h | head -5 | zenity --text-info --title="Listado de directorio mas grande"
# Borro temporales #
rm -R $DirTem
exit 0
