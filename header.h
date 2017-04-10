#ifndef SHELLFISH_H
#define SHELLFISH_H

/* std lib headers */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

/* custom headers */
#include "base_struct.h"
#include "tasks.h"

/* helper functions */
int string_int(char *s);

/* output functions */
void print_check(int task);
void all_good(void);
void no_good(void);

#endif
