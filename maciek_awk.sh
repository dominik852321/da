#!/bin/sh

dodaj_osobe()
{
    read -p "Podaj imie:" imie
    read -p "Podaj nazwisko:" nazwisko
    echo $imie "\t" $nazwisko >> osoby.txt
}
dodaj_ksiazke()
{
    read -p "Podaj tytul ksiazki:" tytul
    read -p "Podaj autora ksiazki:" autor
    read -p "Podaj rok produkcji ksiazki:" rok
    echo $tytul "\t" $autor "\t" $rok >> ksiazki.txt
}
usun_osobe()
{
    pokaz_osoby
    read -p "podaj id osoby do usuniecia:" osoba
    awk -v osoba="$osoba" 'NR!=osoba { print $0 }' osoby.txt >> osoby.txt_temp && mv osoby.txt_temp osoby.txt
}
usun_ksiazke()
{
    pokaz_ksiazki
    read -p "Podaj id ksiazki do usuniecia:" ksiazke
    awk -v ksiazke="$ksiazke" 'NR!=ksiazke { print $0 }' ksiazki.txt >> ksiazki.txt_temp && mv ksiazki.txt_temp ksiazki.txt
}
pokaz_osoby()
{
    echo "Lista osob:"
    awk 'BEGIN{i=1} { print i++ " " $0 }' osoby.txt
}
pokaz_ksiazki()
{
        echo "Lista Ksiazek:"
        awk 'BEGIN{i=1} { print i++ " " $0 }' ksiazki.txt
}
sort_ksiazki()
{
    echo "Wedlug czego posortowac:\n1.tytul \n2.autor \n3.Rocznik"
    read id
    case $id in
        "1") awk '{ print }' ksiazki.txt | sort -k 1;;
        "2") awk '{ print }' ksiazki.txt | sort -k 2;;
        "3") awk '{ print }' ksiazki.txt | sort -k 3;;
        *) echo "Blad, nie ma takiego atrybutu"
    esac
}
sort_osob()
{
    echo "Sortowanie wedlug: \n1.Imie\n2.Nazwisko\n"
    read id
    case $id in
        "1") awk '{ print }' osoby.txt | sort -k 1;;
        "2") awk '{ print }' osoby.txt | sort -k 2;;
    esac
}
edit_osobe()
{
    pokaz_osoby
    read -p "Ktora osobe edytowac: " id
    read -p "Nowe imie:" imie
    read -p "Nowe nazwisko:" nazwisko
    awk -v id="$id" -v imie="$imie" -v nazwisko="$nazwisko" 'NR==id { $1=imie ; $2=nazwisko } { print $1 "\t" $2 } ' osoby.txt >> osoby.txt_temp && mv osoby.txt_temp osoby.txt
}
edit_ksiazke()
{
    pokaz_ksiazki
    read -p "Ktory ksiazke edytowac: " id
    read -p "Nowy autor:" autor
    read -p "Nowa tytul:" tytul
    read -p "Nowy rocznik:" rok
    awk -v id="$id" -v autor="$autor" -v tytul="$tytul" -v rok="$rok" 'NR==id { $1=autor ; $2=tytul ; $3=rok } { print $1 "\t" $2 "\t" $3 }' ksiazki.txt >> ksiazki.txt_temp && mv ksiazki.txt_temp ksiazki.txt
}
main()
{
	echo "\n1.dodaj osobe\n2.Usun osobe\n3.Edytuj osobe\n4.Dodaj ksiazke\n5.Usun ksiazke\n6.Edytuj ksiazke\n7.Sortuj osoby\n8.Sortuj ksiazki\n9.pokaz osoby\n0.pokaz ksiazki\n"
	read -p "Co chcesz zrobic:" wybor
	case $wybor in
		
		"1") dodaj_osobe ;;
		"2") usun_osobe ;;
		"3") edit_osobe ;;
		"4") dodaj_ksiazke ;;
		"5") usun_ksiazke ;;
		"6") edit_ksiazke ;;
		"7") sort_osob ;;
		"8") sort_ksiazki ;;
		"9") pokaz_osoby ;;
		"0") pokaz_ksiazki ;;
		*) echo "Bledna wartosc"
	esac
}

main
