# asa2016
Este repositorio fue creado para experimentar con GIT y desarrollo de scripts para la materia Administración de Sistemas Avanzada. 

Cada alumno/a deberá crear una cuenta en github para trabajar con el repositorio y enviar el nombre de usuario por mail o PEDCO para ser agregado como colaborador/a. 

Luego de ser agregado como colaborador podrá realizar cambios sobre los archivos en el repositorio. 

Para trabajar sin mayores dolores de cabeza cada alumno deberá crear un directorio con su nombre de usuario, y sólo deberá subir cambios a los archivos en su directorio. 

#Secuencia incial para lograr un directorio (asumiendo que git ya está instalado):

$ git clone https://github.com/niniadcobre/asa2016.git (este paso se hace por única vez)
$ cd asa2016
$ mkdir minombredeusuario
$ echo "archivo de prueba" > minombredeusuario/test.txt
$ git add minombredeusuario/test.txt
$ git commit -m "Probando mi git"
$ git push (en este paso sube los cambios a github, por lo que me va a pedir nombre de usuario y contraseña. Recuerden que para poder escribir necesitan estar como colaboradores). 
A partir de aquí los cambios 
$ # Si ahora modificamos o agregamos nuevos archivos sólo debemos hacer: 
$git pull (este comando trae los últimos cambios del repositorio, es conveniente hacerlo siempre antes de pensar en subir cambios)
$git add minombredeusuario/test.txt 
$git commit -m "Texto representativo del cambio"
$git push 



