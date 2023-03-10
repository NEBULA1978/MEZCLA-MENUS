#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Escribo el principio del programa , pidiendo al usuario que introduzca el nombre de su nueva carpeta y quitándole todos los permisos al mismo una vez creada.

echo "Escribe el nombre de tu carpeta"

read carpeta

mkdir $carpeta

chmod -rwx $carpeta

# Creo todas las opciones del menú

Opcion1="Visualizar permisos de $carpeta"
Opcion2="Dar permisos de lectura a $carpeta"
Opcion3="Dar permisos de escritura a $carpeta"
Opcion4="Dar permisos de ejecución a $carpeta"
Opcion5="Quitar permisos de lectura a $carpeta"
Opcion6="Quitar permisos de escritura a $carpeta"
Opcion7="Quitar permisos de ejecucion a $carpeta"

Opcion8="Salir"

# Creo el cuerpo del menú en cuestión , empezando de arriba a abajo ya que primero confeccioné la opción "Salir"

select opcion in "$Opcion1" "$Opcion2" "$Opcion3" "$Opcion4" "$Opcion5" "$Opcion6" "$Opcion7" "$Opcion8"; do
	if [ "$opcion" = "$Opcion8" ]; then
		echo "Gracias por usar mi script! ¿ Deseas borrar la carpeta que acabas de crear ?" # Cuando el usuario elije la opción "Salir" le pregunto si quiere deshacerse de la carpeta que ha creado usando un submenú.
		select opcionexit in "Si" "No"; do
			if [ $opcionexit = "Si" ]; then
				rm -rf $carpeta
				echo "Carpeta borrada correctamente" # Si quiere borrar la carpeta la borra , si no salimos del programa mediante exit.
				exit
			else
				echo "Hasta la próxima!"
exit
fi
done

	# A partir de aquí es todo lo mismo , las opciones 2 , 3 , 4 y 5 son idénticas , solo cambia el echo y el valor de chmod

elif [ "$opcion" = "$Opcion7" ]; then
	chmod -x $carpeta
	echo "Quitando permiso de ejecucion a $carpeta"

elif [ "$opcion" = "$Opcion6" ]; then
	chmod -w $carpeta
	echo "Quitando permiso de escritura a $carpeta"

elif [ "$opcion" = "$Opcion5" ]; then
	chmod -r $carpeta
	echo "Quitando permiso de lectura a $carpeta"

elif [ "$opcion" = "$Opcion4" ]; then
	chmod +x $carpeta
	echo "Agregado permiso de ejecución a $carpeta"

elif [ "$opcion" = "$Opcion3" ]; then
	chmod +w $carpeta
	echo "Agregado permiso de escritura a $carpeta"

elif [ "$opcion" = "$Opcion2" ]; then
	chmod +r $carpeta
	echo "Agregado permiso de lectura a $carpeta"

elif [ "$opcion" = "$Opcion1" ]; then # La opción1 nos permite visualizar los permisos mediante ls -la
	ls -la $carpeta

else
	echo "Opción no válida" # Por último , si el usuario eligiese cualquier otra opción que no fuese de la 1 a la 6 , imprimiríamos en pantalla "Opción no válida"
fi
done