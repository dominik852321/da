BEGIN{
mniejsze=0
wieksze=0
max=0
min=9999999
}

function liczba_mniejsza(){
mniejsze++
tab_mniejsze[$0]=$0
for(i in tab_mniejsze)
{
if (min>tab_mniejsze[i]) min=tab_mniejsze[i]
}#for
}#funkcja

function liczba_wieksza(){
wieksze++
tab_wieksze[$0]=$0
for(i in tab_wieksze)
{
if (max<tab_wieksze[i]) max=tab_wieksze[i]
}#for
}#funkcja

{
if( $0 <0 ) {liczba_mniejsza()}
if( $0 >0 ) {liczba_wieksza()}
}

END{
print "Mniejszych od zera: " mniejsze
print "Wiekszych od zera: " wieksze
print "Max: " max
print "Min: " min
}
