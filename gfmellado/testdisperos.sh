#!/bin/bash

if [[ $# -eq 0 ]] ; then
	printf "Ejecute el script seguido del directorio que quiere analizar (ej.: $0 /tmp)\n"
	exit 1
fi 

archivosdispersos="Los siguientes archivos es muy probable que sean dispersos:"
cantarchdisp=0

for i in $( find $1 -type f -printf '%p''-''%S''\n' 2>/dev/null ) ; do
	if [[ $( echo $i | cut -f 2 -d "-" | cut -f 1 -d "," ) = "0" ]] ; then
		archivosdispersos+="\n${i%%-*}"
		((cantarchdisp+=1))
	fi
done

if [[ $cantarchdisp -eq 0 ]] ; then
	printf "No creo que existan archivos dispersos en ese directorio\n"
else
	printf "$archivosdispersos\n"
fi

