[cc]mc |
.hd csv "convert shell variables to new format" 09/18/84
csv
.ds
'Csv' is a command for system administrators to ease the change when
bringing up revision 9 of the Software Tools Subsystem. The shell
variables save file format has changed at this revision and this command
attempts to convert the variables files mechanically.
'Csv' accepts a list of user names on its first standard input port,
attempts to open the corresponding
variables file (hopefully "=vars=/<user_name>/.vars"), and changes the
special Subsystem character mnemonics for the variables "_eof",
"_erase", "_escape", "_kill", "_newline", and "_retype".
The new shell variables are copied into a temporary file, which
is then used to overwrite the user's permanent variables file.
.sp
This command is best run on an empty system because any users who are
logged in during this execution will have their variables changed, but
when they log out they will overwrite any changes that have been made.
Also, the system administrator will have to change his variables
manually because when he logs out he will overwrite any changes
already made. The easiest way to execute this command is probably to
list the files under "=vars=", remove any non-user files, and pipe
the resulting list into 'csv'.
.es
valid_users> csv
lf -c =vars= | =ebin=/csv
.me
Self explanatory.
.fl
=temp=/?*
=vars=/<user_name>/.vars
.bu
Could probably be a little more intelligent.
.sa
[ul User's Guide for the Software Tools Subsystem Command Interpreter],
[ul Software Tools Subsystem Manager's Guide]
[cc]mc
