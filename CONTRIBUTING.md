# How to contribute

I'm really glad you're reading this, because we need volunteer developers to help this project come to fruition.

#### **Did you find a bug?**

	* **Ensure the bug was not already reported** by searching on GitHub under [Issues](https://github.com/rails/rails/issues).

	* If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/glyif/shellfish/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or an **executable test case** demonstrating the expected behavior that is not occurring.

* For more detailed information on submitting a bug report and creating an issue, visit our [reporting guidelines](https://help.github.com/articles/creating-an-issue/).

#### **Did you write a patch that fixes a bug?**
		* Open a new GitHub pull request with the patch.

		* Ensure the PR description clearly describes the problem and solution. Include the relevant issue number if applicable.

		* Before submitting, please read these guidelines

#### **Did you fix whitespace, format code, or make a purely cosmetic patch?**

Changes that are cosmetic in nature and do not add anything substantial to the stability, functionality, or testability of Rails will generally not be accepted (read more about [our rationales behind this decision](https://github.com/rails/rails/pull/13771#issuecomment-32746700)).

## Submitting changes

Please send a [GitHub Pull Request to Bobby](https://github.com/glyif/shellfish/pull/new/master) with a clear list of what you've done (read more about [pull requests](http://help.github.com/pull-requests/)). We can always use more test coverage. Please follow our coding conventions (below) and make sure all of your commits are atomic (one feature per commit).

Always write a clear log message for your commits. One-line messages are fine for small changes, but bigger changes should look like this:

    $ git commit -m "A brief summary of the commit
    >
    > A paragraph describing what changed and its impact."

## Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be compiled on Ubuntu 14.04 LTS
- Your programs and functions will be compiled with `gcc 4.8.4` (`C90`) using the flags `-Wall -Werror -Wextra and -pedantic`
- All your files should end with a new line
- Your code should use the `Betty` style. It will be checked using [`betty-style.pl`](https://github.com/holbertonschool/Betty/blob/master/betty-style.pl) and [`betty-doc.pl`](https://github.com/holbertonschool/Betty/blob/master/betty-doc.pl)
- No more than 5 functions per file
- All your header files should be include guarded
- Unless specified otherwise, your program must have the exact same output as `sh` as long as the exact same error output.

## Credits
This document is based on the examples listed in Github's support article on [setting guidelines for repos](https://help.github.com/articles/setting-guidelines-for-repository-contributors/).
