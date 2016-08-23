#!/bin/bash

#Creo los directorios temporales
mkdir /tmp/bajatemporal/
cd /tmp/bajatemporal/

wget http://pages.cs.wisc.edu/~remzi/OSTEP/

#Armo el indice de los capitulos

grep '.pdf' index.html | grep 'yellow><a'|sed -e 's,^.*href=,,' -e 's, .*$,,'> libro.tmp

grep '.pdf' index.html | sed -e 's,^.*><small>,,' |sort -n |grep '</small>'|sed -e 's,^.*href=,,' -e 's, .*$,,'|grep '.pdf'>>libro.tmp

grep '.pdf' index.html | grep '3EA99F'|sed -e 's,^.*href=,,' -e 's, .*$,,'>>libro.tmp

#Bajo los capitulos

for i in $(cat libro.tmp);do
    wget http://pages.cs.wisc.edu/~remzi/OSTEP/$i
done

#Armo el libro
ARMAR=`cat libro.tmp`
pdfunite $ARMAR libroOSTEP.pdf

#Copio el libro al directorio del usuario y limpio el desastre
cp /tmp/bajatemporal/libroOSTEP.pdf ~/libroOSTEP.pdf
rm -r /tmp/bajatemporal/
