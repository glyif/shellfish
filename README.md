<img src="https://www.holbertonschool.com/assets/holberton-logo-1cc451260ca3cd297def53f2250a9794810667c7ca7b5fa5879a569a457bf16f.png" alt="Holberton logo">

# Project Shellfish

## RTFM
**Please look into the code before you use it!**  We are using sudo, so be sure
you know what you are doing first! Don't trust us; look in the code!

## Synopsis
Project Shellfish is an automated task checker for Holberton School's 0x15. C -
Simple Shell project.

## File Breakdown

## Update
Be sure to update your checker with this script.  This script sets **shellfish**
as your remote upstream, then implements `reset --hard`, which resets your
current branch to the most recent updates from **shellfish** master.  All your
changes will be lost.  If you would like to contribute to this project, do not
use the update script.  You should then use another process explained by:
@yeungegs here:  
https://gist.github.com/yeungegs/b18019dbf0466a523b0521bae405b066

```
$ ./update
```

## Configuration

To get started all you need to do is run the `init.sh` script.

```
$ ./init.sh
```

* if it is your first time, you will be prompted for your github username. This
will be used to clone a copy of your `simple_shell` into a sub directory.

  * **NOTE:** If the project is on your partner's github account, make sure to
  use your partner's github name.

* your project will be compiled with gcc and these Warning flags in the output
file: ``hsh``.

  ```
  $ gcc -Wall -Werror -Wextra -pedantic *.c -o hsh
  ```

* then your shell (``hsh`` file) will be copied into the **shellfish**
directory, and your shell project directory will be deleted.

  * **Bypass compiliation:** these steps can be bypassed if you copy your shell
  into the directory for the **shellfish** checker.  If you bypass these steps,
  be sure to properly compile your code.

  * **test_shell:** you can modify the config file so that the line ``SHELL``
  reads: ``SHELL="./test_shell"``.  This will use a basic shell as a test
  instead of your shell.

## Usage

```
$ ./shellfish.bash
```

## Errors

your shell will not run with our init script if it does not compile with the
above -Warning flags.  If your shell does not run in 'non-interactive' mode,
(i.e. executed through a ``|`` [pipe]) properly you will not pass.  If your
shell does not exactly replicate the output of ``sh`` you will not pass.

### Authors:

Julien Barbier: julien@holbertonschool.com  
Bobby Yang: 122@holbertonschool.com  
David John Coleman II: lcsw@davidjohncoleman.com
