#include <stdio.h>
#include "tasks.h"
#include <unistd.h>

void print_check(int task)
{
	printf("%s Task %d ---------------------------  ", "Checking", task);
}

void all_good(void)
{
	printf("[ " ANSI_COLOR_GREEN "OK" ANSI_COLOR_RESET " ]" "\n");
}

void no_good(void)
{
	printf("[ " ANSI_COLOR_RED "NOPE" ANSI_COLOR_RESET " ]" "\n");
}

int check_zero(void)
{
	int check;
	print_check(0);

	check = access("README.md", F_OK);
	if (check != -1)
	{
		all_good();
		return (0);
	}
	else
	{
		no_good();
		return (1);
	}
}
