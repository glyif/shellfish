#include <stdio.h>
#include "header.h"

int main(int argc, char **argv)
{
	int i, j;
	int task;
	tasks_t assignment[] = {
		{ 0, check_one}
	};

	if (argc == 1)
	{
		for (i = 0; i < 1; i++)
			assignment[i].f();
	}
	else if (argc >= 2)
		for (i = 1; i < argc; i++)
		{
			task = string_int(argv[i]);

			for (j = 0; j < 1; j++)
			{
				if (task == assignment[j].task_id)
				{
					assignment[j].f();
				}
			}
		}

	return (0);
}
