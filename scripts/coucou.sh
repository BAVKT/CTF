#!/bin/sh

trap 'clear ; echo "Oui... Mais non." ; sleep 2' 1 2 3 6 9 15

coucou=""

if [[ -z "${1}" ]]
then
	coucou="T deg ? ";
else
	coucou="${1}";
fi

while [ 1 ]
do
	for i in {1..15} {17..231} {235..256}
	do
		echo "\x1b[7m\033[38;5;${i}m ${coucou} \033[0m\c"
	done
done
