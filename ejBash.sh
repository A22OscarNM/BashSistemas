#!/bin/bash
echo `clear`
salir=true;
green='\e[0;32m'
red='\e[0;31m'
purple='\e[0;95m'
blue='\e[0;34m'
echo -e "${purple}██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗"
echo "██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝"
echo "██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  " 
echo "██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  "
echo "╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗"
echo " ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"
sleep 2                                                                            


function menu(){
	echo `clear`
	sleep 1
	echo -e "${purple}╔══════════════════════════════════════════════════════════════╗"
	echo -e "║               ${blue}Escoge una de estas opciones:                  ${purple}║"
	echo "╠══════════════════════════════════════════════════════════════╣"
	echo -e "▓   ${blue}1. Muestra el contenido de un archivo o carpeta            ${purple}▓"
	echo -e "▓   ${blue}2. Modifica los permisos de una carpeta o archivo          ${purple}▓"
	echo -e "▒   ${blue}3. Añadirle contenido a un fichero (si no existe lo crea)  ${purple}▒"
	echo -e "▒   ${blue}4. Elevar un número a otro                                 ${purple}▒"
	echo -e "░   ${blue}5. Crear un Hola Mundo automatico                          ${purple}░"
	echo -e "░   ${blue}6. Salir del programa                                      ${purple}░"
	echo -e "╚══════════════════════════════════════════════════════════════╝${green}"
	read -p "Escribe el número correspondiente a la opcion: " answer
	return $answer;
}

function content(){
	echo `clear`
	sleep 1
	read -p "Escribe la ruta del archivo: " ruta
		if [ -e $ruta ]
		then
			if [ -d $ruta ]
			then
				echo -e `ls $ruta`"${red}"
			else
				echo -e `cat $ruta`"${red}"
			fi
		else
			echo -e "No existe la ruta especificada ${red}"
		fi
	read  -p "(Pulsa enter para continuar)" enter
}

#En windows no me funcina bien esta parte ya que no me deja modificar los permisos,
#pero lo probe en mi Debian y me va perfecto.
function permiso(){
	echo `clear`
	sleep 1
	read -p "Escribe la ruta del archivo: " rutaPer
	if [ -e $rutaPer ]
	then
		read -p "Escribe los permisos que quieras añadirle (En binario, ej: 700): " permisos
		echo `chmod $permisos $rutaPer`
		echo -e `ls -la $rutaPer`"${red}"
	else
		echo -e "No existe la ruta especificada ${red}"
	fi
	read  -p "(Pulsa enter para continuar)" enter
}

function anhadir(){
	echo `clear`
	sleep 1
	read -p "Escribe la ruta del fichero a modificar: " rutaMod
	read -p "Escribe el contenido que quieres agregarle: " cont
	echo -e `echo $cont >> $rutaMod`"${red}"
	read -p "(Pulsa enter para continuar)" enter
}

function potencia(){
	echo `clear`
	sleep 1
	read -p "Escribe el número base: " base
	read -p "Escribe la potencia del número: " numPotencia

	i=1
	if [ $numPotencia -eq 1 ]
	then
		echo -e $base"${red}"
	elif [ $numPotencia -eq 0 ]
	then
		echo -e "1${red}"
	else
		newBase=$base
		while(( i < numPotencia))
		do
			newBase=$(($newBase * $base))
			((i++))
		done
		echo -e $newBase"${red}"
	fi
	read  -p "(Pulsa enter para continuar)" enter
}

function holaMundo(){
	echo `clear`
	sleep 1
	read -p "Escrbie el nombre del fichero: " fichero
	echo "#!/bin/bash" >> $fichero.sh
	#Por si acaso (ya se que no esta bien esta practica)
	echo `chmod 777 $fichero.sh`
	echo "" >> $fichero.sh
	echo -e "echo Hola Mundo" >> $fichero.sh
	read  -p "(Pulsa enter para continuar)" enter
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
		holaMundo
		;;
		6)
		salir=false
		;;
		*)
		echo -e "${red}No has selecionado una opcion de las proporcionadas"
		sleep 2
		;;
	esac
done
echo `clear`
echo -e "${purple}██╗ ██████╗ ██╗   ██╗███████╗██╗"
echo "╚═╝ ██╔══██╗╚██╗ ██╔╝██╔════╝██║"
echo "██╗ ██████╔╝ ╚████╔╝ █████╗  ██║"
echo "██║ ██╔══██╗  ╚██╔╝  ██╔══╝  ╚═╝"
echo "██║ ██████╔╝   ██║   ███████╗██╗"
echo "╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝"