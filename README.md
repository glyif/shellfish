<img src="https://www.holbertonschool.com/assets/holberton-logo-1cc451260ca3cd297def53f2250a9794810667c7ca7b5fa5879a569a457bf16f.png" alt="Holberton logo">

# Project Shellfish

## RTFM
**Please look into the code before you use it!**  We are using sudo, so be sure
you know what you are doing first! Don't trust us; look in the code!

## Synopsis
Project Shellfish is an automated task checker for Holberton School's 0x15. C -
Simple Shell project.

## File Breakdown
* Dockerfile
  The Dockerfile contains a simple set of instructions for Docker during build
  time and runtime.

* init.sh
  This cript is a script, copied into the image that clones your shell repo,
  compiles it with all of the flags, clones the checker repo, moves your shell
  executable into the checker folder then runs the checker.

## Prerequisites
The only prerequisite is to install docker. You can have this running in your
vagrant or on your local host because it uses a container, it will not mess
with your system and everytime you run the tests a new container will be started
so you do not have to worry about any system issues.

To install Docker, please refer to the Docker install manual for Ubuntu trusty
64: 'Trusty 14.04 (LTS)', linked here: https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

NOTE: Install the CE edition, not the EE edition

## Use
After you have installed docker please follow the following instructions.

```bash
$ git clone https://github.com/glyif/shellfish.git
$ cd shellfish
$ docker build -t shellfish:latest .
```

To run the tests
```bash
$ docker run -ti --rm shellfish GITHUBUSR
# GITHUBUSR is the github user that the simple_shell is on. e.g. glyif
```
* **NOTE:** once you build your docker image, for continued testing all
  you need to do is update your remote master of your shell repository,
  and then repeat the previous command.  There is no need to update your
  checker.  The update process for the checker occurs automatically.

 * For Users running natively on MacOS, not vagrant
   When you run `docker run` you'll also need to include the following
   tags: `--security-opt seccomp:unconfined`

## Expected Output & other Errors

Failed checks are output in RED, passed checks are output in GREEN.  ALL errors written to stderr are output for all instances.  When your shell and `sh` both output errors, the errors are written in grey.  If your shell does not have an error, but `sh` does, the output is in RED, and visa versa.
 
  - ![#f03c15](https://placehold.it/15/f03c15/000000?text=+) `[FAIL]`
  - ![#c5f015](https://placehold.it/15/c5f015/000000?text=+) `[PASS]`

* **NOTE:** your shell will not run with our init script if it does not compile
  with the above -Warning flags.  If your shell does not run in 'non-interactive'
  mode, (i.e. executed through a ``|`` [pipe]) properly you will not pass.  If
  your shell does not exactly replicate the output of ``sh`` you will not pass.

## Contribute:
If you would like to contribute to this project, please follow the process outlined here: https://gist.github.com/yeungegs/b18019dbf0466a523b0521bae405b066

## Authors:

Julien Barbier: julien@holbertonschool.com  
Bobby Yang: 122@holbertonschool.com  
David John Coleman II: lcsw@davidjohncoleman.com  
Elaine Yeung elaine.yeung@holbertonschool.com
