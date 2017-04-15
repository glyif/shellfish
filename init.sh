#!/bin/bash
source config
CONFIG=config
DIRECTORY=src

if [ -z "$GITHUBUSR" ]
then
	echo -e 'Enter the GitHub username where your shell is hosted: \n'
	read GITHUBUSR
	echo "GITHUBUSR=$GITHUBUSR" >> $CONFIG
fi

if [ -d "$DIRECTORY" ]; then
	rm -rf src
fi

#pulls github repo, names it src and cds into it
git clone https://github.com/$GITHUBUSR/simple_shell.git src && cd src

#runs gcc with alllllll the flags
$COMPILE

#copies hsh into root
cp hsh ..

#goes back into root
cd ../

#removes src
rm -rf src
