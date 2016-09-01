#!/bin/bash

archivosdispersos="Los siguientes archivos es muy probable que sean dispersos:"

for i in $( find $1 -type f -printf '%p''-''%S''\n' )
do
if [[ $( echo $i | cut -f 2 -d "-" | cut -f 1 -d "," ) = "0" ]]
then
archivodisperso=$( echo "$i" | cut -f 1 -d "-" )
archivosdispersos+="\n$archivodisperso"
fi
done
echo -e $archivosdispersos


