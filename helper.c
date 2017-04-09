#include "header.h"

/**
 * string_integer - converts string to int
 * @s: string
 *
 * Return: converted int
 */
int string_int(char *s)
{
	int i, len;
	int result;

	len = strlen(s);

	result = 0;
	for (i = 0; i < len; i++)
		result = result * 10 + (s[i] - '0' );

	return (result);
}
