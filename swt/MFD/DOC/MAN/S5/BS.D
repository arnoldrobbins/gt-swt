.hd bs "shell backstop program" 02/25/82
bs
.ds
'Bs' is a shell file that executes the program 'guess'
when a command is not found in a user's search rule.
'Guess' is a program that
tries to find a command "close" to one that was mistyped.
This shell file may be added to the end of a user's search rule
so that it can aid a fumble-fingered typist.
.es
<<'bs' should not normally be run from command level>>
.bu
Because of search rule problems, 'bs' will fail if a user
does not have the current directory in his search rule.
.sp
Locally supported.
.sa
bs1 (5), guess (5), mkclist (3)
