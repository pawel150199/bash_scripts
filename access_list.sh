#!/bin/bash
#clear
#sprawdza liczbe argumentów
if [  "$#" -lt 2 ] || [  "$#" -gt  4 ];
then
     echo "Liczba argumentów nie zgadza się!"
     exit
fi

#sprawdza czy pierwszy parametr składa się z 3 znaków
if [  ! "$(echo "$1" | wc -c)" -eq 4 ]; then 
	echo "Pierwszy parametr nie składa się z 3 znaków!"
	exit
fi

#sprawdza czy podane parametry są prawidłowe
for (( i=2; i<="$#"; i++)) do   
    if ! ([  "${!i}" = "f" ] || [  "${!i}" = "l" ] || [  "${!i}" = "d" ]); then
            echo "Podano niedozwolony parametr! Dozwolone jest f,d,l"
            exit
    fi
done
#sprawdza czy każda z cyfr jest mniejsza bądź równa 7
for((i=1; i<=3; i++))
do
	if ! [ "$(echo "$1" | cut -c "$i")" -le 7 ]; then
		echo "Nieprawidłowa cyfra w prawach dostępu! maksymalnie możesz wpisać 7"
		exit
	
fi
done
#if  [ "$2" != "$3" ]; then
   #echo " Podane parametry pokrywają się ze sobą!"
   #exit
#fi
#echo "Uprawnienia przed zmianą: $(ls -l | awk '{print $1, $9}')"
for((i=2; i<="$#"; i++)) do
	if [ "${!i}" = "f" ]; then
		if [ "$(ls -l | grep "^-" -c)" -eq 0 ]; then
			echo "Brak plików w których można zmienić uprawnienia"
		else
			ls -l | grep "^-" | awk '{print $9}' | xargs chmod "$1"
			echo "Zmieniono uprawnienia!"
		fi
	elif [ "${!i}" = "d" ]; then
		if [ "$(ls -l | grep "^d" -c)" -eq 0 ]; then
			echo "Brak katalogów w których można zmienić uprawnienia"
		else
			ls -l | grep "^d" | awk '{print $9}' | xargs chmod "$1"
			echo "Zmieniono uprawnienia!"
		fi
	elif [ "${!i}" = "l" ]; then
		if [ "$(ls -l | grep "^l" -c)" -eq 0 ]; then
			echo "Brak dowiązań w których można zmienić uprawnienia"
		
		else	
			ls -l | grep "^l" | awk '{print $9}' | xargs chmod "$1"
			echo "Zmieniono uprawnienia pliku do którego istnieje dowiązanie"
		#zmiana uprawnień dowiązania symbolicznego nie jest możliwa poleceniem chmod, ponieważ przy użyciu tego polecenia jest zmieniany plik do którego dowiązujemy
		fi
		
	fi
done
#echo "uprawnienia po zmianie:  $(ls -l  | awk '{print $1, $9}')"

