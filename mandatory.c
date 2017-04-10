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

	system("gcc --version > your.txt");
	system("diff your.txt gcc--version.txt > difference.txt");

	fd = open("difference.txt", O_RDONLY);
	diffread = read(fd, &buffer, 1024);
	close(fd);

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

int check_ls(void)
{
	int fd;
	char buffer[1024];
	ssize_t diffread;

	system("echo \"/bin/ls\" | ./hsh > your.txt");
	system("echo \"/bin/ls\" | sh > expected.txt");

	system("diff your.txt expected.txt > difference.txt");

	fd = open("difference.txt", O_RDONLY);
	diffread = read(fd, &buffer, 1024);
	close(fd);

	if (diffread == 0)
	{
		all_good();
		print_check(2);

		system("cat test_ls_2 | ./hsh > your.txt");
		system("cat test_ls_2 | sh > expected.txt");

		system("diff your.txt expected.txt > difference.txt");

		fd = open("difference.txt", O_RDONLY);
		diffread = read(fd, &buffer, 1024);
		close(fd);

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
	else
	{
		no_good();
		write(STDOUT_FILENO, &buffer, diffread);
		return (1);
	}

}
