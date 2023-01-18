#!/bin/bash
echo `clear`
salir=true;

function menu(){
	sleep 1
	echo ""
	echo "#####################################"
	echo "Escoge una de estas opciones":
	echo "1. Muestra el contenido de un archivo o carpeta"
	echo "2. Modifica los permisos de una carpeta o archivo"
	echo "3. Añadirle contenido a un fichero (si no existe lo crea)"
	echo "4. Elevar un número a otro"
	echo "5. "
	echo "6. Salir del programa"

	read -p "Escribe el número correspondiente a la opcion: " answer
	return $answer;
}

function content(){
	sleep 1
	echo ""
	read -p "Escribe la ruta del archivo: " ruta
		if [ -e $ruta ]
		then
			if [ -d $ruta ]
			then
				echo `ls $ruta`
			else
				echo `cat $ruta`
			fi
		else
			echo No existe la ruta especificada
		fi
}

#En windows no me funcina bien esta parte ya que no me deja modificar los permisos,
#pero lo probe en mi Debian y me va perfecto.
function permiso(){
	sleep 1
	echo ""
	read -p "Escribe la ruta del archivo: " rutaPer
	if [ -e $rutaPer ]
	then
		read -p "Escribe los permisos que quieras añadirle (En binario, ej: 700): " permisos
		echo `chmod $permisos $rutaPer`
		echo `ls -la $rutaPer`
	else
		echo No existe la ruta especificada
	fi
}

function anhadir(){
	sleep 1
	echo ""
	read -p "Escrbie la ruta del fichero a modificar: " rutaMod
	read -p "Escribe el contenido que quieres agregarle: " cont
	echo `echo $cont >>  $rutaMod`
}

function potencia(){
	sleep 1
	echo ""
	read -p "Escrbie el número base: " base
	read -p "Escribe la potencia del número: " numPotencia

	i=1
	if [ $numPotencia -eq 1 ]
	then
		echo $base
	elif [ $numPotencia -eq 0 ]
	then
		echo 1
	else
		newBase=$base
		while(( i < numPotencia))
		do
			newBase=$(($newBase * $base))
			((i++))
		done
		echo $newBase
	fi
}

while $salir
do
	menu
	case $? in
		1)
		content
		;;
		2)
		permiso
		;;
		3)
		anhadir
		;;
		4)
		potencia
		;;
		5)
		
		;;
		6)
		salir=false
		;;
		*)
		echo No has selecionado una opcion de las proporcionadas
		;;
	esac
done