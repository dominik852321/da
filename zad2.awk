BEGIN{
mniejsze=0
wieksze=0
srednia_wieksza=0
srednia_mniejsza=0
}

function liczba_mniejsza(){
mniejsze++
tab_mniejsze[$0]=$0
} 

function liczba_wieksza(){
wieksze++
tab_wieksze[$0]=$0
dlugosc_wieksza=length($0)
}

{
if( $0 <0 ) {liczba_mniejsza()}
if( $0 >0 ) {liczba_wieksza()}
}

END{

for(i in tab_mniejsze){
srednia_mniejsza=srednia_mniejsza+tab_mniejsze[i]
}

for(i in tab_wieksze){
srednia_wieksza=srednia_wieksza+tab_wieksze[i]
}

srednia_mniejsza=srednia_mniejsza/mniejsze
srednia_wieksza=srednia_wieksza/wieksze

print "Mniejszych od zera: " mniejsze
print "Wieksze od zera: " wieksze
print "Srednia mniejsza: " srednia_mniejsza
print "Srednia wieksza: " srednia_wieksza
}
