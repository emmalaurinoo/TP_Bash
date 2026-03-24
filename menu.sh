#!/bin/bash
opcion=0
if [ "$1" = "-d" ]; then
	rm -rf "$HOME/EPNro1"
	pkill -f consolidar.sh
	echo "Matando Procesos"
	exit 0
fi

export FILENAME="filename"

while [ "$opcion" -ne 6 ]
do
	echo "------MENU-------"
	echo "1) Crear entorno"
	echo "2) Correr proceso"
	echo "3) Listar alumnos"
	echo "4) Top 10 notas"
	echo "5) Buscar padrón"
	echo "6) Salir"

	read opcion

	case $opcion in
		1)
			echo "Elegiste la opción 1"
			mkdir -p "$HOME/EPNro1/entrada"
			mkdir -p "$HOME/EPNro1/salida"
			mkdir -p "$HOME/EPNro1/procesado"
			;;
		2)	echo "Elegiste la opción 2, Corriendo proceso en bakground, Agrega tus archivos en EPro1/entrada"
			cp "$HOME/consolidar.sh" "$HOME/EPNro1/consolidar.sh"
			bash "$HOME/EPNro1/consolidar.sh" &
			;;
		3)
			echo "Elegiste la opción 3"
			sort -k1 -n "$HOME/EPNro1/salida/$FILENAME.txt"
			;;
		4)	echo "Eligiste la opción 4"
			sort -k5 -nr "$HOME/EPNro1/salida/$FILENAME.txt" | head -n 10
			;;
		5)	echo "Elegiste la opción 5"
			echo "Ingresa tu numero de padron: "
			read padron
			grep -w "$padron" "$HOME/EPNro1/salida/$FILENAME.txt"
			;;
		6)
			echo "Saliendo."
			;;
		*)
			echo "Opción inválida"
			;;
	esac
done
