#include <stdio.h>
#include <unistd.h>

int check_one(void)
{
	int check;

	check = access("README.md", F_OK);
	if (check != -1)
	{
		printf("hehe, you have the readme\n");
		return (0);
	}
	else
	{
		printf("you are a poop stain, add a readme\n");
		return (1);
	}
}
