#!/bin/bash
# Scrip para automatización de backup accesible al usuario , con interface para elegir archivo. Utiliza zenity.
#
##################### Variables #####################
#
DirTempo=/tmp/file$((RANDOM))
cfg=accesobkp.cfg
Destino=$HOME/bkp
#
##################### Funciones #####################
#
function FileSelect {
  while [[ ! $Salida = "Salir" ]] ; do
     ArcSel=`zenity --file-selection --title="Seleccionar un Archivo"`
	case $? in
	   0)  echo $ArcSel >> $cfg ;;
           1)  Salida="Salir"
	       if [ ! -f $cfg ]; then
	       zenity --error --title "Error!!!!" --text="Ocurrió un error no esperado, NO SELECCIONÓ NINGUN ARCHIVO!!.."
	       exit 2
	       fi ;;
          -1)  zenity --error --title "Error!!!!" --text="Ocurrió un error no esperado, vuelva a intentar!!.."; rm $cfg;  exit 1 ;;
	esac
  done
}
#
##################### Inicio #####################
# Verifico si estoy pre-configurado en accesobkp.cfg y si esta Zenity Instalado
#
dpkg -l | grep zenity &> /dev/null
if [ "$?" != "0" ] ; then
  echo "No Puedo ejecutarme, por falta de zenity.... Instale y vuelva a ejecutar!!"
  exit 2
fi
if [ ! -f $cfg ]; then
  zenity --title "Que hago..." --info --text="Script para realizar copias de seguridad de los archivos que elegias a la carpeta $Destino."
  FileSelect
fi
#
##################### Realizo BKP #####################
# Creo Temporales y realizo tarea en bkp/fecha_archivo
mkdir $DirTempo
echo "Empezando a copiar la directorio temporal: $DirTempo"
for file in `cat $cfg`; do
  echo "copiando archivo: $file al directorio temporal"
  cp $file $DirTempo
done
if [ ! -d $Destino ]; then
  zenity --title "Creo Destino..." --info --text="Voy a crear el Directorio $Destino."
  mkdir $Destino
fi
tar -czvf $Destino/`date +%Y%m%d`_accesobkp.tar.gz $DirTempo
#
######################### Terminado ###########################
# Borro Temporales
rm -R $DirTempo
# Fin del script
zenity --info --title "Fin Copia de BackUp" --text="Se a realizado el BackUp exitosamente..";exit 0
