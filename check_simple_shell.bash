#!/bin/bash
#
# Performing checks on the Holberton School "simple shell" project

#######################################
# Print KO, in red, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_ko()
{
    echo -e "[\033[31mKO\033[37m]"
}

#######################################
# Print OK in green, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_ok()
{
    echo -e "[\033[32mOK\033[37m]"
}

#######################################
# Prints error messages if any
# Globals:
#   RED
#   ERROROUTPUTFILE
#   ERROREXPECTED
#   BLACK
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_error()
{
	echo -ne "\033[31m"
	if [ -s $ERROROUTPUTFILE ]; then
		echo ""
		echo "your error: " && cat $ERROROUTPUTFILE
		echo ""
	fi
	if [ -s $ERROREXPECTED ]; then
		echo ""
		echo "expected error: " && cat $ERROREXPECTED
		echo ""
	fi
	echo -ne "\033[37m"
}

#######################################
# Checks differences
# Globals:
#   DIFF
#   OUTPUTFILE
#   EXPECTED
# Arguments:
#   None
# Returns:
#   None
#######################################
function check_diff()
{
	diff $OUTPUTFILE $EXPECTED > $DIFF
	if [ -s $DIFF ]; then
		print_ko
		echo -ne "\033[30m"
		echo "this is the difference between your output and the expected:"
		echo -ne "\033[31m"
		cat $DIFF
		echo -ne "\033[37m"
	else
		print_ok
	fi
}

#######################################
# Kill the shell in a clean way and remove temporary files
# Globals:
#   SHELL
#   OUTPUTFILE
#   EXPECTED
#   DIFF
#   ERROROUTPUTFILE
#   ERROREXPECTED
#   LTRACEOUTPUTFILE
# Arguments:
#   None
# Returns:
#   None
#######################################
function stop_shell()
{
    if [ `pidof $SHELL | wc -l` -ne 0 ]; then
	   killall -9 $SHELL 2>&1 > /dev/null
    fi
	> $OUTPUTFILE && > $EXPECTED && > $DIFF && > $ERROROUTPUTFILE && > $ERROREXPECTED
	rm -f $LTRACEOUTPUTFILE
	rm -f checker_tmp_file_*
}

# Load configuration
source config

# Introduction
echo -ne "\033[34m"
echo "     *************************************"
echo "     ***                               ***"
echo "     ***     Beginning Test Suite      ***"
echo "     ***      Please be patient        ***"
echo "     ***     ...and know the code      ***"
echo "     ***                               ***"
echo "     *************************************"
echo ""
echo "contributors:"
cat AUTHORS | tail -n +3
echo ""

# Prompt to check to continue
echo -ne "\033[31m"
echo "type 'y' or 'Y' & click enter to continue, or"
read -p "type anything else to quit: " choice
case "$choice" in
  y|Y ) echo "yes";;
  * ) exit 1;;
esac

# Cleanup
echo -ne "\033[37m"
> $OUTPUTFILE && > $EXPECTED && > $DIFF && > $ERROROUTPUTFILE && > $ERROREXPECTED
rm -f $LTRACEOUTPUTFILE
rm -f checker_tmp_file_*

# Locates all tests and launch them
for dir in `ls -d "$TESTDIR"/*/`
do
    echo "> $dir"
    for testname in `ls "$dir" | grep -v "~$"`
    do
	   echo -n "   # $testname: "
	   source "$dir$testname"
    done
done

# Cleanup
> $OUTPUTFILE && > $EXPECTED && > $DIFF && > $ERROROUTPUTFILE && > $ERROREXPECTED
rm -f $LTRACEOUTPUTFILE
rm -f checker_tmp_file_*
rm -f /tmp/.checker_tmp_file_*
rm -f > $OUTPUTFILE $EXPECTED $DIFF $ERROROUTPUTFILE $ERROREXPECTED
echo -ne "\033[30m"
