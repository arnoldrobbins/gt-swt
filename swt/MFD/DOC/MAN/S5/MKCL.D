.hd mkcl "generate a command list file for guess" 01/03/83
mkcl [-s]
.ds
'Mkcl' is not intended to be user-invoked; rather, it is a utility
used by the 'mkclist' command to build a list of commands in a
compressed binary format for the use of the 'guess' command.
'Mkcl' reads a list of command names from standard input, one name
per line, and builds a binary output file.  This binary output file
contains the command names ordered by name length first and then
alphabetical order; i.e., all the one-character commands come first
in alphabetical order, then the two-character commands in alphabetical
order, etc.  File marks are used to allow fast locates of a command
within the file.
.sp
If the optional argument "-s" is specified, then 'mkcl' generates a
new system command file; otherwise, it generates a new user command
file.  Because binary output is used, the output of 'mkcl' should
never be sent to the terminal, but to a file or to a pipe for
further processing.
.es
lf -c =bin= =lbin= =ebin= | sort | uniq | mkcl -s
lf -c =bin= =lbin= =ebin= =ubin= | sort | uniq | mkcl
.fl
.in +5
.ti -5
creates =extra=/clist if a system command list is desired.
.ti -5
creates =ubin=/clist if a per-user command list is desired.
.in -5
.me
.in +5
.ti -5
"Usage: mkcl ..." if invalid arguments are specified.
.ne 5
.ti -5
"Can't create clist file" if trying to create a system command
file from a nonowner account to the =extra= directory, or if
trying to create a private
user command list without having the directory =ubin= defined.
.ne 2
.ti -5
"Overflow!!!!!!!! arggggg..." if there are more commands than
can be handled in the program's data area.
.ne 2
.ti -5
"writef returned an error" if the program could not write the
file header of file marks.
.ne 2
.ti -5
"writef died in loop" if the program did not finish writing the
command names to the command file.
.ne 3
.ti -5
"writef died on last writef" if the program could not update the
file header with new information after writing out the commands.
.ti -5
"seekf returned error" if the program could not rewind the command file.
.in -5
.bu
If there are more than 600 commands or more than 4096 characters
total in all the command names, table overflow occurs.
.sp
It could be hazardous to your terminal's health to copy the
resulting command list file, since there may be some terminal
control sequences embedded within the binary file.
.sp
Locally supported.
.sa
bs (5), bs1 (5), guess (5), mkclist (3)
