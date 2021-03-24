#!/bin/bash
#clear

#sprawdza liczbe argumentów
if [  "$#" -lt 1 ] || [  "$#" -gt  3 ];
then
     echo "liczba argumentów nie zgadza się!"
     exit
fi

#sprawdza czy podane parametry są prawidłowe
for (( i=1; i<="$#"; i++)) do   
    if ! ([  "${!i}" = "f" ] || [  "${!i}" = "l" ] || [  "${!i}" = "d" ]); then
            echo "Podano niedozwolony parametr! Dozwolone jest f,d,l"
            exit
    fi
done
#if [ "$1" != "$3" ] || [ "$2" != "$3" ]; then
   #echo " Podane parametry pokrywają się ze sobą!"
   #exit
#fi
ZWYKLE=$(ls -l  | grep -c "^-")
KATALOGI=$(ls -l  | grep -c "^d")
DOWIAZANIA=$(ls -l  | grep -c "^l")

#Wyświetlanie w postaci liczb
for ((i=1; i<="$#"; i++))
do
    if [ "${!i}" = "f" ]; then
        echo -e "Plików zwykłych: $ZWYKLE "
        break
    fi
done

for ((i=1; i<="$#"; i++))
do
    if [ "${!i}" = "d" ]; then
        echo -e "Katalogów: $KATALOGI"
        break
    fi
done

for ((i=1; i<="$#"; i++))
do
    if [ "${!i}" = "l" ]; then
        echo -e "Dowiązań symbolicznych: $DOWIAZANIA"
        break
    fi
done
echo 
echo
#Wyświetlanie plusów
function wyswietl {
    if [ "$1" -eq 0 ]; then 
        echo 
        return
    elif [ "$1" -eq 1 ]; then
        echo "+"
        return
    else
        for (( i=1; i<="$1"; i++ ))
        do
            echo -n "+"
            if [ "$i" -eq "$1" ]; then
                echo
            fi
        done
        return
    fi
}

for ((i=1; i<="$#"; i++))
do
    if [ "${!i}" = "f" ]; then
        echo -n "Pliki zwykłe: "
       wyswietl "$ZWYKLE"
    fi
done

for ((i=1; i<="$#"; i++))
do
    if [ "${!i}" = "d" ]; then
        echo -n "Katalogi: "
       wyswietl "$KATALOGI" 
    fi
done

for ((i=1; i<="$#"; i++))
do
    if [ "${!i}" = "l" ]; then
        echo -n "Dowiązania symboliczne: "
        wyswietl "$DOWIAZANIA"
    fi
done   

