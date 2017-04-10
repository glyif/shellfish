#include "header.h"

int is_update(char *update)
{
	if (strcmp(update, "update") == 0)
	{
		update_shellfish();
		return (0);
	}
	else
	{
		return (1);
	}
}

void update_shellfish(void)
{
	int check;
	
	check = system("git clone https://github.com/glyif/shellfish.git && cd shellfish && sudo ./install.sh && cd ../ && rm -rf shellfish");

	if (check == -1)
		perror("You done messed up");
	else
		printf("Updated Shellfish......................\n");
}
		
		
