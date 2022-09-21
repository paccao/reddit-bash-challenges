### Challenges

1. Write a script that records in a log all the processes launched after the script and specifies their parent.
2. Edit recursively all the name of the files in a directory changing the uppercase letters to lowercase.
3. Write a script that continously shows the time with seconds.
4. Write a script that draws a graph of the percentage of CPU used by a process, given a PID as an argument. Also, give the option to specify the size of the sampling as an argument.
5. Write a script that checks all the directories specified by the user for files that are duplicates, even if they have a different name.
6. A disk in which we need to copy a big number of files is broken and throws an error when it's used for more than X seconds. To avoid getting an error, we have to write a script that copies a directory in another one stopping for A seconds every B seconds.

## Commands learned:
`$ <COMMAND> | grep "searchString in the output of <COMMAND>"`
`set -eu` Fail on error and undefined vars.
`-e` Exit immediately if a command exists with a non-zero status.
`-u` Treat unset variables as an error when substituting (executing a command and substitute it with its standard output. This command executes in a subshell, its own environment. Syntax: `$()` ).

A pipeline is a sequence of one or more commands separated by one of the control operators `'|' or '|&'`.
Use `set -o pipefail`, script fails on a single failed command in a pipeline instead of continuing

A symlink is a symbolic Linux/ UNIX link that points to another file or folder on your computer or a connected file system. This is similar to a Windows shortcut.

redirection of output to /dev/null is the idiomatic bash way of saying lets hide this output. Everything that gets directed to /dev/null gets deleted. For example `$(get_latest_version 2>/dev/null)`