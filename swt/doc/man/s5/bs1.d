.hd bs1 "shell backstop program" 01/03/83
bs1
.ds
'Bs1' is a shell file that executes the program 'guess'
when a command is not found in a user's search rule.
This program is identical to 'bs' except that it calls
'guess' with an argument of "1" for <maxcost>.  This
significantly reduces the search time, but restricts the
set of commands that 'guess' will consider.
.es
<<'bs1' should not normally be run from command level>>
.bu
Because of search rule problems, 'bs1' will fail if a user
does not have the current directory in his search rule.
.sp
Locally supported.
.sa
bs (5), guess (5), mkclist (3)
