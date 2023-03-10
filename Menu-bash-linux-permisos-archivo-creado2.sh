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

# Escribo el principio del programa , pidiendo al usuario que introduzca el nombre de su nuevo fichero y quitándole todos los permisos al mismo una vez creado.

echo "Escribe el nombre de tu fichero o selecciona uno de la lista siguiente:"

# Muestro los archivos en la carpeta actual con un número delante
i=1
for file in *; do
    echo "$i) $file"
    i=$((i + 1))
done

# Pido al usuario que seleccione un archivo
read -p "Selección: " fileIndex

# Obtengo el nombre del archivo seleccionado
file=`ls -1 | sed -n "$fileIndex p"`

# Creo todas las opciones del menú

Opcion1="Visualizar permisos de $file"
Opcion2="Dar permisos de lectura a $file"
Opcion3="Dar permisos de escritura a $file"
Opcion4="Dar permisos de ejecución a $file"
Opcion5="Quitar permisos de lectura a $file"
Opcion6="Quitar permisos de escritura a $file"
Opcion7="Quitar permisos de ejecucion a $file"

Opcion8="Salir"

# Creo el cuerpo del menú en cuestión , empezando de arriba a abajo ya que primero confeccioné la opción "Salir"

select opcion in "$Opcion1" "$Opcion2" "$Opcion3" "$Opcion4" "$Opcion5" "$Opcion6" "$Opcion7" "$Opcion8"; do
	if [ "$opcion" = "$Opcion8" ]; then
		echo "Gracias por usar mi script!"
		exit

	elif [ "$opcion" = "$Opcion7" ]; then
		chmod -x $file
		echo "Quitando permiso de ejecucion a $file"

	elif [ "$opcion" = "$Opcion6" ]; then
		chmod -w $file
		echo "Quitando permiso de escritura a $file"

	elif [ "$opcion" = "$Opcion5" ]; then
		chmod -r $file
		echo "Quitando permiso de lectura a $file"

	elif [ "$opcion" = "$Opcion4" ]; then
		chmod +x $file
		echo "Agregado permiso de ejecución a $file"

	elif [ "$opcion" = "$Opcion3" ]; then
		chmod +w $file
		echo "Agregado permiso de escritura a $file"

	elif [ "$opcion" = "$Opcion2" ]; then
		chmod +r $file
		echo "Agregado permiso de lectura a $file"

	elif [ "$opcion" = "$Opcion1" ]; then 
		ls -la $file

	else
		echo "Opción no válida"
	fi
done

