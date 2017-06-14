#!/bin/bash
#pulls github repo, names it src and cds into it
git clone https://github.com/"$1"/simple_shell.git src

#runs gcc with alllllll the flags
gcc -Wall -Werror -Wextra -pedantic ./src/*.c -o hsh

#removes src
rm -rf src

#clone checker repo
git clone https://github.com/glyif/shellfish

#move exec into checker repo
mv hsh ./shellfish

#run the chekcer
./shellfish/shellfish.bash
