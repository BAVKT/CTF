/*
	Résolution : 
	- On passe un fichier en 2eme argument au programme
	- BONJOUR écrit à la ligne 13 du fichier
	- Release le password en hexa
	FLAG : You_Finished_The_HxC_Mode_BRAVO!
*/

#include "libft.h"
#include <stdio.h>

//Do nothing
void	ok(){return ;}
//Affiche en hexadecimal le char passé en argument
void	print_hex(char s) { printf("%02x", (unsigned int)s); }
//Affiche un sous-tiret si besoin (en hexa)
void	nide() { print_hex(95);}

// l'usage (très très important)
void usage()
{
	printf("Vous devez donner l'argument magique au programme pour récupérer le flag.");
	exit(0);
}

//Le fail qui fait quitter
void	nope()
{
	printf("Lol nope");
	exit(-20);
}

//Affiche en hexadecimal les 4 lettres passées en arg et un tiret dans cvertains cas
void	feurst(int a, int b, int c, int d)
{
	if (a == 10)
		return ;
	print_hex((char)a);
	print_hex((char)b);
	print_hex((char)c);
	print_hex((char)d);
	if (a + b + c + d == 'd'+'d'+'Y' || a == 77)
		nide();
}

//Affiche une partie du flag (Finished_)
void seg()
{
	int tab[10] = {95, 130, 135, 130, 140, 129, 126, 125, 120, 95};
	int i = -1;

	while (++i < 9)
		print_hex(tab[i] - 25);
}

//It's a trap
void	wow1()
{
	print_hex(100 - 34);
	print_hex(100 + 14);
	print_hex(100 - 3);
	print_hex(100 + 18);
	print_hex(100 + 11);
	print_hex(100 - 67);
}

//Affiche le bravo final
void wow2()
{
	print_hex(100 - 34);
	print_hex(100 - 18);
	print_hex(100 - 35);
	print_hex(100 - 14);
	print_hex(100 - 21);
	print_hex(100 - 67);
}

//Check si c'est bien bonjour qu'on a reçu dans la string
//Print une partie du flag a chaque lettre bonne écrit dans le fichier
void	rjb(char *s, int z)
{
	s[z] == 65+1 && s[1] == 79 ? feurst(89, 111, 117, 95) : nope();
	s[2] == 39*2 ? seg() : nope();
	s[3] == 148/2 ? feurst(84, 104, 101, 95) : feurst(78, 111, 112, 101);
	s[4] == 36*2 ? ok() : feurst(72, 120, 67, 95);
	s[5] == 850/10 ? feurst(77, 111, 100, 101) : feurst(78, 111, 112, 101);
	s[6] != 21+19+15+25+(2*1)-7+(49/7) ? wow1() : wow2();
	s[7] != 88-75*2+99-65/2 ? feurst(10, 111, 82, 84) : ok();
	ft_strdel(&s);
	exit (666);
}

//Lit le fichier et vérifie que bonjour est bien écrit a la 13eme ligne
int		pouet(char *str)
{
	int		fd;
	int		i;
	char	*s;

	if ((fd = open(str, O_RDONLY)) < 0)
		nope();
	s = NULL;
	i = -1;
	while (get_next_line(fd, &s) > 0)
		++i == 12 ? ok() : free(s);
	ft_strlen(s) != 7 ? nope() : rjb(s, 0);
	return (0);
}

//Pied
int main(int ac, char **av)
{
	if (ac != 3 || pouet(av[2]))
		nope();
	else if (!ft_strcmp(av[1], "usage"))
		usage();
	else
		nope();
	return (0);
}
