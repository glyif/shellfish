#include "header.h"

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
