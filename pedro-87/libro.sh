#!/bin/bash
##El argumento deb ser la url del libro(la idea era no hacerlo tan especifico, pero creo no poder) 

if [[ "$#" != "1" ]] ; then
	echo "Falta url del libro como \$1"
	exit 1 
fi

if [[ -d resolucion ]] ; then
	echo "ya existe el directorio resolucion"
	exit 1
fi


##crea un directorio y descarga el index
mkdir resolucion
cd resolucion
wget $1

##creo una variable que nombrara las descargas
nombre=1

##Descargo y renombro "la parte en amarillo" de la pagina referente al libro
for i in $( grep '.pdf' index.html | grep 'yellow' | cut -d '=' -f3 | cut -d ' ' -f1 ) ; do 
	wget -O $nombre $1$i
	let nombre++
		
done

##Idem anterior parte naranja
regla=3
for i in $( grep '.pdf' index.html | grep 'f88017' | cut -d '=' -f3 | cut -d ' ' -f1 | head -18 ) ; do 
	resto=$(($regla%2))
        if [[ "$resto" -eq "1" && "$nombre" -lt "23" ]] ; then 

	wget -O $nombre $1$i
	let nombre++

	else

	nuevoNombre=$(($nombre+8))
 	wget -O $nuevoNombre $1$i
	
	fi
	
	let regla++
        
         
done

nombre=$(($nuevoNombre+1))

##naranja
for i in $( grep '.pdf' index.html | grep 'f88017' | cut -d '=' -f3 | cut -d ' ' -f1 | tail -4 ) ; do
        wget -O $nombre $1$i
        let nombre++

done


##turquesa
for i in $( grep '.pdf' index.html | grep '00aacc' | cut -d '=' -f3 | cut -d ' ' -f1 ) ; do
        wget -O $nombre $1$i
        let nombre++

done

##verde
for i in $( grep '.pdf' index.html | grep '4CC417' | cut -d '=' -f3 | cut -d ' ' -f1 ) ; do
        wget -O $nombre $1$i
        let nombre++

done


##verde diferente
for i in $( grep '.pdf' index.html | grep '3EA99F' | cut -d '=' -f3 | cut -d ' ' -f1 ) ; do
        wget -O $nombre $1$i
        let nombre++

done

##borro index
rm -r index.html

##armo el libro y elimino las descargas
libro=$(ls | sort -n)
pdfunite $libro libro.pdf

rm -r {1..61} 

echo "-------------------------------------------------------"
echo "Dentro del directorio RESOLUCION se encuentra LIBRO.pdf" 

