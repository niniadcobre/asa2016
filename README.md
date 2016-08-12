# asa2016
Este repositorio fue creado para experimentar con GIT y desarrollo de scripts para la materia Administración de Sistemas Avanzada. 

Cada alumno/a deberá crear una cuenta en github para trabajar con el repositorio y enviar el nombre de usuario por mail o PEDCO para ser agregado como colaborador/a. 

Luego de ser agregado como colaborador podrá realizar cambios sobre los archivos en el repositorio. 

Para trabajar sin mayores dolores de cabeza cada alumno deberá crear un directorio con su nombre de usuario, y sólo deberá subir cambios a los archivos en su directorio. 

##Secuencia incial para lograr un directorio (asumiendo que git ya está instalado):
<pre>
$ git clone https://github.com/niniadcobre/asa2016.git (este paso se hace por única vez) <br>
$ cd asa2016 <br>
$ mkdir minombredeusuario <br>
$ echo "archivo de prueba" > minombredeusuario/test.txt <br>
$ git add minombredeusuario/test.txt<br>
$ git commit -m "Probando mi git"<br>
$ git push (en este paso sube los cambios a github, por lo que me va a pedir nombre de usuario y contraseña. Recuerden que para poder escribir necesitan estar como colaboradores). <br>
<br>
$ # Si ahora modificamos o agregamos nuevos archivos sólo debemos hacer: <br>
$git pull (este comando trae los últimos cambios del repositorio, es conveniente hacerlo siempre antes de pensar en subir cambios)<br>
$git add minombredeusuario/test.txt <br>
$git commit -m "Texto representativo del cambio"<br>
$git push <br>
</pre>


