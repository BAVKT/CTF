tar -xf bonjour.tar
rm bonjour.tar
pax -rf start.pax
rm start.pax
gunzip Un_peu_long.tar.gz
tar -xf Un_peu_long.tar
rm Un_peu_long.tar
bunzip2 pouet.tar.bz2
tar -xf pouet.tar
rm pouet.tar
xz -d not_yet.pax.xz
pax -rf not_yet.pax
rm not_yet.pax
tar -xf soon_the_end.tar
rm soon_the_end.tar
xz -d final.txt.gz.bz2.xz
bunzip2 final.txt.gz.bz2
gunzip final.txt.gz
cat final.txt
