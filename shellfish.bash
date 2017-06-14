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
    echo -e "[\033[31mFAIL\033[37m]"
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
    echo -e "[\033[32mPASS\033[37m]"
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
	if [[ -s "$ERROROUTPUTFILE" || -s "$ERROREXPECTED" ]]; then
		echo "------------error outputs test--------------"
		echo "--------------------------------------------"
		if [ -s "$ERROROUTPUTFILE" ]; then
			echo "<     your error: "
			echo "--------------------------------------------"
			cat "$ERROROUTPUTFILE"
		else
			echo -ne "\033[31m"
			echo "** your shell has nothing written to stdout **"
			echo "**  when there is an expected error output  **"
		fi
		if [ -s "$ERROREXPECTED" ]; then
			echo ">     expected error: "
			echo "--------------------------------------------"
			cat "$ERROREXPECTED"
		else
			echo -ne "\033[31m"
			echo "**   there is no expected error,   **"
			echo "** but your shell writes to stderr **"
		fi
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
	diff "$OUTPUTFILE" "$EXPECTED" > "$DIFF"
	if [ -s "$DIFF" ]; then
		print_ko
		echo -ne "\033[30m"
		echo "--------------------!outputs differ!---------------------"
		echo "          your shell '<' -- expected output '>'"
		echo "---------------------------------------------------------"
		echo -ne "\033[31m"
		cat "$DIFF"
		echo -ne "\033[37m"
	else
		print_ok
	fi
}

#######################################
# Checks for certain functions in your code
# Globals:
#   LTRACEOUTPUTFILE
# Arguments:
#   None
# Returns:
#   None
#######################################
function check_function()
{
	if [ -s "$DIFF" ]; then
		print_ko
		echo -ne "\033[30m"
		echo "** ltrace returned these functions from your file:"
		echo "% time     seconds  usecs/call     calls      function"
		echo "------ ----------- ----------- --------- --------------------"
		echo -ne "\033[31m"
		cat "$DIFF"
		echo -ne "\033[37m"
		echo "------ ----------- ----------- --------- --------------------"
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
    if [ $(pidof "$SHELL" | wc -l) -ne 0 ]; then
	   killall -9 "$SHELL" > /dev/null 2>&1
    fi
	> "$OUTPUTFILE" && > "$EXPECTED" && > "$DIFF" && > "$ERROROUTPUTFILE" && > "$ERROREXPECTED"
	rm -f "$LTRACEOUTPUTFILE"
	rm -f checker_tmp_file_*
}

# Load configuration
source config

# Introduction
echo -ne "\033[34m"
echo "     *************************************"
echo "     ***                               ***"
echo -n "     ***     "
echo -ne "\033[32m"
echo -n "Beginning Test Suite      "
echo -ne "\033[34m"
echo "***"
echo -n "     ***      "
echo -ne "\033[35m"
echo -n "Please be patient        "
echo -ne "\033[34m"
echo "***"
echo -n "     ***     "
echo -ne "\033[36m"
echo -n "...and know the code      "
echo -ne "\033[34m"
echo "***"
echo "     ***                               ***"
echo "     *************************************"
echo ""
echo -ne "\033[30m"
echo "contributors:"
cat AUTHORS | tail -n +2
echo ""

# Cleanup
echo -ne "\033[37m"
echo "--------------------------------------------"
echo "--------------------------------------------"
> "$OUTPUTFILE" && > "$EXPECTED" && > "$DIFF" && > "$ERROROUTPUTFILE" && > "$ERROREXPECTED"
rm -f "$HOME"/.simple_shell_history
rm -f "$LTRACEOUTPUTFILE"
rm -f checker_tmp_file_*

# Locates all tests and launch them
for dir in $(ls -d "$TESTDIR"/*/)
do
	echo "--------------------------------------------"
	echo "  >>     $dir"
	echo "--------------------------------------------"
    for testname in $(ls "$dir" | grep -v "~$")
    do
		cat "${dir}${testname}" | head -3 | tail -1
		echo -n "test -> $testname: "
		source "$dir$testname"
    done
done

# Cleanup
> "$OUTPUTFILE" && > "$EXPECTED" && > "$DIFF" && > "$ERROROUTPUTFILE" && > "$ERROREXPECTED"
rm -f "$LTRACEOUTPUTFILE"
rm -f checker_tmp_file_*
rm -f /tmp/.checker_tmp_file_*
rm -f ./*txt
echo -ne "\033[30m"
