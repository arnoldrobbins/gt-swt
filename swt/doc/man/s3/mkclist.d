[cc]mc |
.hd mkclist "create a list of commands for backstop" 08/28/84
[cc]mc
mkclist [ -s ]
.ds
'Mkclist' lists the commands in "=lbin=", "=bin=", "=ubin=", and
the internal
shell commands, sorts them into order, and places them in
"=ubin=/clist".
This file is used by the backstop program as the file of commands
to search through.
.sp
The template "=ubin=" must refer to the user's  personal
command directory.
By default, the system-wide template "=ubin=" refers to
"//=user=/bin".
.sp
The "-s" option causes 'mkclist' to omit "=ubin=" from the list
of commands and place the resulting list in "=extra=/clist",
thus creating the system default command list.
[cc]mc |
.es
mkclist
[cc]mc
.me
"Usage ..." for improper arguments
[cc]mc |
.bu
Bombs if =ubin= does not exist.
[cc]mc
.sa
bs (5), bs1 (5), guess (5)
