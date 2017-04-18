#!/bin/bash
#pulls github repo, names it src and cds into it
git clone https://github.com/"$1"/simple_shell.git src

#cd into folder
cd src

#runs gcc with alllllll the flags
gcc -Wall -Werror -Wextra -pedantic *.c -o hsh

#copies hsh into root
cp hsh ..

#goes back into root
cd ../

#removes src
rm -rf src

#clone checker repo
git clone https://github.com/glyif/shellfish

#move exec into checker repo
mv hsh shellfish

#cd into shell
cd shellfish

#run the chekcer
./shellfish.bash
