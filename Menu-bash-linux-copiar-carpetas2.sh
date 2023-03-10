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

# Mostrar las carpetas en la carpeta home del usuario con un número delante para que el usuario pueda seleccionar una

echo "Selecciona una carpeta para copiar:"

select folder in ~/.*; do
	if [ -z "$folder" ]; then
		echo "Opción no válida"
	else
		break
	fi
done

file="$folder"

echo "Introduce la ruta donde deseas guardar:"
read destino

echo "Selecciona una carpeta de destino:"

select folderDest in $destino/*; do
	if [ -z "$folderDest" ]; then
		echo "Opción no válida"
	else
		break
	fi
done

destination="$folderDest"

cp -r $file $destination

echo "Carpeta $file copiada a $destination"
