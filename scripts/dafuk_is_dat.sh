#!/bin/sh -

STD="\033[0m"
BIY="\033[1;93m"

clear
printf "${BIY}Bienvenue !\n${STD}"
printf "\033[1;91m-> 5 scripts viennent d'être créés.\n${STD}"
printf "\033[1;92m-> Chacun d'entre eux fait quelque chose de différent.\n${STD}"
printf "\033[1;94m-> Seul l'un d'entre eux donne des points.\n${STD}"
printf "\033[1;95m-> Choisis bien ou tu risques d'être déçus.\n${STD}"
printf "${BIY}B\033[1;91mI\033[1;92mS\033[1;94mO\033[0;96mU\033[1;95mS${STD}\n"

echo """#!/bin/sh -\n

clear\n
echo 'Congratz !'\n
echo 'Le flag pour ce challenge est : CFLAGS{p0u3t_101}'\n
rm script0.sh
rm script1.sh
rm script2.sh
rm script3.sh
rm script4.sh\n""" >> script0.sh

echo """#!/bin/sh -\n

clear\n
echo '\e(0'\n
rm script0.sh
rm script1.sh
rm script2.sh
rm script3.sh
rm script4.sh\n""" >> script1.sh

echo """#!/bin/sh -\n

clear\n
echo 'Félicitation pour cette magnifique balle tirée dans le pied.\n'
alias ls='echo \"Bravo tu as cassé ton ls.\"'\n
rm script0.sh
rm script1.sh
rm script2.sh
rm script3.sh
rm script4.sh\n""" >> script2.sh

echo """#!/bin/sh -\n

clear\n
rm script0.sh
rm script1.sh
rm script2.sh
rm script3.sh
rm script4.sh
cat /dev/urandom\n""" >> script3.sh

echo """#!/bin/sh -\n

clear\n
sh coucou.sh\n
rm script0.sh
rm script1.sh
rm script2.sh
rm script4.sh

trap 'rm script3.sh; exit 0;""" >> script4.sh

rm dafuk_is_dat.sh
