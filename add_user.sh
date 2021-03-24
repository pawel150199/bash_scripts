#!/bin/bash
#clear
#W celu poprawnego działania skryptu i dodania uzytkowników należy uruchomić go jako root

if ! ([ "$1" = "bash" ] || [ "$1" = "zsh" ] || [ "$1" = "sh" ]); then
	echo "nieprawidłowa powłoka"
	exit
fi 
if [ ! -e /bin/"$1" ]; then
		echo "Brak podanej powłoki w systemie, zostanie ona zainstalowana!"
		sudo apt install "$1"
#if [ ! "$#" -ge 3 ]; then
	#echo "Niepoprawna liczba argumentów!"
	#exit
#fi

#dodaje uzytkowników zgodnie z zalożeniami podanymi w parametrach
for ((i=3; i<="$#"; i++))
dokonuje
	if [ "$2" = "domT" ]; then
		sudo useradd -s /bin/"$1" -d /home/"${!i}" -m "${!i}"
		echo "Poprawnie dodano użytkownika ${!i}!"
	elif [ "$2" = "domN" ]; then
		sudo useradd -s /bin/"$1"  "${!i}"
		echo "Poprawnie dodano użytkownika ${!i}!"
	else
		echo "Niepoprawny parametr!"
		exit

	fi
	
	#tworzy plik logów
	echo "data dodania użytkownika ${!i}: ">>plik_logów
	date>>plik_logów 
	finger "${!i}">>plik_logów
	
done
