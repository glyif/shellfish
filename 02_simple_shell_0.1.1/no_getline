#!/bin/bash
#
# check if the getline function was used by using ltrace

command="/bin/ls
/bin/ls
/bin/ls"

# clean up
stop_shell
rm -f $tmp_file

# send commands
echo "$command" | $LTRACE -bc -o $LTRACEOUTPUTFILE $SHELL > $OUTPUTFILE 2> /dev/null &

# wait a little bit
$SLEEP $SLEEPSECONDS

# check the result
nmatch=`cat $LTRACEOUTPUTFILE | grep getline | wc -l`
if [ $nmatch -eq 1 ]; then
    print_ko
else
    print_ok
fi

# clean up
stop_shell
rm -f $tmp_file
