#include <stdio.h>
#include "tasks.h"
#include <unistd.h>

int check_one(void)
{
	int check;

	check = access("README.md", F_OK);
	if (check != -1)
	{
		printf("README CHECK [" ANSI_COLOR_GREEN "OK" ANSI_COLOR_RESET "]" "\n");
		return (0);
	}
	else
	{
		printf("you are a poop stain, add a readme\n");
		return (1);
	}
}
