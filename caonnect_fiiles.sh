#!/bin/bash

#connect_files
#make new files from 2 other files which you must give to input variable.

#sprawdza czy liczba parametrów jest poprawna
if [ "$#" -lt 2 ];
then
     echo "Za mało argumentów!"
     exit
     
fi
if [ ! -w "$1" ]; then
		echo "nie ma prawa zapisu do pliku!"
		exit
fi
#sprawdza czy dane pliki są zgodne z założeniami
for ((i=1; i<="$#"; i++))
do
	if [ ! -e "${!i}" ]; then
		echo " plik nie istnieje!"
		exit
	elif [ ! -f "${!i}" ]; then
		echo "plik nie jest zwykłym plikiem!"
		exit
	elif [ ! -r "${!i}" ]; then
		echo "nie ma prawa odczytu z pliku!"
		exit
	elif [ ! -s "${!i}" ]; then
		echo "plik jest pusty!"
		exit
done

#łączenie plików
for((i=2; i<="$#"; i++))
	do
	cat "${!i}" >> "$1"
done



