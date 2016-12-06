#!/bin/bash

function print_ko()
{
    echo -e "[\033[31mKO\033[37m]"
}

function print_ok()
{
    echo -e "[\033[32mOK\033[37m]"
}

function stop_shell()
{
    if [ `pidof $SHELL | wc -l` -ne 0 ]; then
	   killall -9 $SHELL 2>&1 > /dev/null
    fi
    rm -f $PIPE $OUTPUTFILE $ERROROUTPUTFILE $LTRACEOUTPUTFILE
}

source config

echo -ne "\033[37m"
rm -f $OUTPUTFILE $LTRACEOUTPUTFILE

for dir in `ls -d "$TESTDIR"/*/`
do
    echo "> $dir"
    for testname in `ls "$dir" | grep -v "~$"`
    do
	   echo -n "   # $testname: "
	   source "$dir$testname"
    done
done

rm -f $OUTPUTFILE $LTRACEOUTPUTFILE $ERROROUTPUTFILE
rm -f checker_output_*
rm -f checker_tmp_file_*
rm -f /tmp/.checker_tmp_file_*
echo -ne "\033[37m"
