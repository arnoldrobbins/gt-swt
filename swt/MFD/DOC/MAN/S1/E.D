[cc]mc |
.hd e "invoke proper editor for current terminal" 07/24/84
[cc]mc
e  [ <filename> { <se options> } ]
.ds
'E' is a shell file used to invoke the proper editor ('ed' or 'se')
for a given terminal.
In addition, 'e' will remember the name of the last file edited,
and reuse that name if none is specified on the command line.
.sp
'E' will make use of the variables 'f' and 'se_params' if the
user has declared them at the terminal level.
'F' is used to store the name of the last file edited; consequently,
the user need only type the command "f" to have that name printed.
'Se_params' is used to store personally-preferred instructions for
the initialization of 'se', such as the choice between absolute
and relative line numbers, case mapping, etc.
It may be any sequence of legal 'se' arguments, separated by blanks.
Furthermore, additional screen editor options may be selected by
including them on the 'e' command line after the file name argument.
If either 'f' or 'se_params' is not declared at lexic level 0,
'e' will assume that they are empty.
.sp
'E' selects the proper editor to invoke by calling the 'term_type'
command to see if the screen editor supports the current
terminal type.
.es
e time_sheet
e
.me
.in +5
.ti -5
None from 'e', but several may result from the editors or the shell.
.br
.in -5
[cc]mc |
.bu
Since 'se' knows about users' terminal types, and since 'se' now
reads personal commands in =home=/.serc, this command is pretty
much obsolete.
[cc]mc
.sa
ed (1), se (1), if (1), term_type (1)
