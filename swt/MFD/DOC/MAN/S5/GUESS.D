.hd guess "try to guess what command the user means" 01/03/83
guess <command> [ <maxlevels> ]
.ds
'Guess' is a program which tries to discern the correct command
when a misspelled command is entered.
The program works by
computing a "distance" between a misspelled command and commands in
a predefined list.  If any commands are found with a distance less than a
predefined tolerance, 'guess' will present for selection all
commands in the group that have the lowest distance.  If this list
contains only one command, it will ask for verification that it
selected the right command.  If this list contains more than one
command, it
prefaces each command by a number, and asks for the correct command
to be selected by number.
In either case, a response of a single carriage return means
"don't execute anything."
If the list has more than 10 commands in the group with lowest
distance, 'guess'  responds as the Subsystem normally does:
"<command>: not found".
.sp
'Guess' searches through the file "=extra=/clist" which contains
[cc]mc |
the system internal commands, commands from "=lbin=" and "=bin=".
[cc]mc
The user can define his own list to include his
personal command directory by running the program 'mkclist', and
this will create a file in the user's "bin" directory "=ubin=/clist".
.fl
=ubin=/clist
.br
=extra=/clist
.bu
'Guess' will not consider commands that are accessible from
the user's search rule, but not in one of the "clist" files.
.es
<<'guess' should not normally be run from command level>>
.bu
Locally supported.
.sa
bs (5), bs1 (5), mkclist (3)
