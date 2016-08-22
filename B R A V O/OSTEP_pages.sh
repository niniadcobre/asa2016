#! /bin/bash

# check bin
which pdfunite 2>&1
 if [[ "$?" != "0" ]]; then
	echo -e '\033[33;7m Usted no tiene instalado pdfunite para convertir los pdfs a un solo. Si no lo instala no podrá ser satisfactorio el script \033[m'
	echo Direccionando al link de descarga ...
	firefox http://www.linuxfromscratch.org/blfs/view/svn/general/poppler.html
	break
fi

# descarga
#wget --mirror http://pages.cs.wisc.edu/~remzi/OSTEP/

# yellow pages 
cat index.html | grep yellow | cut -d "=" -f3 | sed 's/style//g' >> mirror.tmp

# orange pages 
grep f88017 < index.html | grep '<small>[01-99]\{1,3\}</small>' | cut -d ">" -f3,4,5 | sort -n | cut -d "=" -f2 | sed 's/style//g' >> mirror.tmp

# blue pages 
grep 00aacc < index.html | grep '<small>[01-99]\{1,3\}</small>' | cut -d ">" -f3,4,5 | sort -n | cut -d "=" -f2 | sed 's/style//g' >> mirror.tmp

# green pages 
grep 4CC417 < index.html | cut -d "=" -f3 | sed 's/style//g' >> mirror.tmp

# aqua pages
grep 3EA99F < index.html | cut -d "=" -f3 | sed 's/style//g' >> mirror.tmp

# ordenando
PWD=`pwd`
MIRROR=`cat mirror.tmp | sed -e '/^$/d' -e "s,^,${PWD}/pages.cs.wisc.edu/~remzi/OSTEP/," | tr -d "\n"`

# construyendo el pdf
printf "~~> procesando el pdf, aguarde...\n"
pdfunite $MIRROR OSTEP.pdf

# limpieza
rm -r pages.cs.wisc.edu
rm mirror.tmp

# execute PDF & end script
evince OSTEP.pdf
