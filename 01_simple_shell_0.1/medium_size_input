#!/bin/bash
#
# check if a medium size command line does not break the shell

command="                                       /bin/ls                                                                                                                                                                                                                                                                                                                                                                                                                                                     "
tmp_file="checker_tmp_file_$RANDOM"

# clean up
stop_shell
rm -f $tmp_file

# create a pseudo random file
touch $tmp_file
# send commands
echo "$command" | $SHELL > $OUTPUTFILE 2> /dev/null &

# wait a little bit
$SLEEP $SLEEPSECONDS

# check the result
nmatch=`cat $OUTPUTFILE | grep -c "$tmp_file"`
if [ $nmatch -eq 1 ]; then
	   print_ok
else
	   print_ko
fi

# clean up
stop_shell
rm -f $tmp_file
