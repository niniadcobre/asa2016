#!/bin/bash
#################################################################################################
# Scrip para realizar descarga de los manuales del sitio http://pages.cs.wisc.edu/~remzi/OSTEP/ #
# Trabajo para realizar en la Materia Administración Avanzada de Sistema - UNCo                 #
#################################################################################################
#
#
# Alternativa (A) Scrip para descargar y Ordenar los pdf del sitio http://pages.cs.wisc.edu/~remzi/OSTEP/ desde una lista armada
# manualmente y ordenada.
# Alternativa (B) hacer una matriz: Descargar el html con
# wget -np -c -nd -N -A .html http://pages.cs.wisc.edu/~remzi/OSTEP/ -P Variable de carpeta temporal (/tmp/$RANDOM)
# luego, leer a partir de la linea 180 con sed y buscar los pdf, asignar a una variable y realizar descarga del archivo, cambiando
# el nombre según el nombre de la matriz:
# wget -r -np -c -nd -N $DESARCHI http://pages.cs.wisc.edu/~remzi/OSTEP/ -P $ARCTEMPO (/tmp/$RANDOM)
# Se puede usar una función para no repetir tanto codigo.
# busc
# A01|B01|C01|D01|E01|F01|
# A02|B02|C02|D02|E02|F02|
# A03|B03|C03|D03|E03|F03|
# ·
# ·
# A16|B16|C16|D16|E16|F16|
# luego, cambiar los nombres de los archivos de A1, A2, B1 C4 a 01, 02 ,03.... y su sespectivo nombre....
#################################################################################################

