#!/bin/bash
entrada="$HOME/EPNro1/entrada"
salida="$HOME/EPNro1/salida/$FILENAME.txt"
procesado="$HOME/EPNro1/procesado"

while true
do
	for info in "$entrada"/*.txt
	do
		if [ -f "$info" ]; then
			cat "$info" >> "$salida"
			mv "$info" "$procesado/"
		fi
	done
	sleep 2
done


