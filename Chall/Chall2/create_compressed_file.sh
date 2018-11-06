echo "Je_Suis_Bien_Detendu_Maintenant" > final.txt
gzip final.txt
bzip2 final.txt.gz
xz final.txt.gz.bz2
tar -cvf soon_the_end.tar final.txt.gz.bz2.xz
rm final.txt.gz.bz2.xz
pax -wf not_yet.pax soon_the_end.tar
rm soon_the_end.tar
xz not_yet.pax
tar -cvf pouet.tar not_yet.pax.xz
rm not_yet.pax.xz
bzip2 pouet.tar
tar -cvf Un_peu_long.tar pouet.tar.bz2
rm pouet.tar.bz2
gzip Un_peu_long.tar
pax -wf start.pax Un_peu_long.tar.gz
rm Un_peu_long.tar.gz
tar -cvf bonjour.tar start.pax
rm start.pax
