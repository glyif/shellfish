#include "header.h"

int check_readme(void)
{
	int check;

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

int _compiler(void)
{
	int fd;
	char buffer[1024];
	ssize_t diffread;

	system("gcc --version > your-output.txt");
	system("diff your-output.txt gcc--version.txt > difference.txt");

	fd = open("difference.txt", O_RDONLY);
	diffread = read(fd, &buffer, 1024);
	close(fd);
	system("rm your-output.txt difference.txt");

	if (diffread == 0)
	{
		all_good();
		return (0);
	}
	else
	{
		no_good();
		write(STDOUT_FILENO, &buffer, diffread);
		return (1);
	}

}
