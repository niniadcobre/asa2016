#!/bin/bash

if [[ "$#" = "0" ]]
then
echo -e "Ejecute el script seguido del directorio que quiere analizar (ej.: $0 /tmp)"
exit 1
fi 

archivosdispersos="Los siguientes archivos es muy probable que sean dispersos:"
cantarchdisp=0

for i in $( find $1 -type f -printf '%p''-''%S''\n' 2>/dev/null )
do
if [[ $( echo $i | cut -f 2 -d "-" | cut -f 1 -d "," ) = "0" ]]
then
archivodisperso=${i%%-*}
((cantarchdisp+=1))
archivosdispersos+="\n$archivodisperso"
fi
done

if [[ "$cantarchdisp" = "0" ]]
then
echo "No creo que existan archivos dispersos en ese directorio"
else
echo -e $archivosdispersos
fi

