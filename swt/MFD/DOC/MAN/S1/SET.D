[cc]mc |
.hd set "assign values to shell variables" 09/11/84
[cc]mc
set [ <variable> ] = [ <string> ]
.ds
'Set' can be used to assign arbitrary values
to shell variables.  The first argument is the name of the variable to be
set; if absent, the value is printed on standard output instead of
being assigned.
The third argument
is the value to be assigned to the variable; if absent, one line is read
from standard input, and the text thus entered becomes the string to be
assigned.
[cc]mc |
The string may contain unprintable characters in a mnemonic form.
This consists of a '<' sign followed by an ascii mnemonic and
terminated by a '>' symbol. To prevent a symbol from being interpreted,
simply escape the '<' with and '@' sign.
For example to set
the variable lfcr to a linefeed and a carriage return, use:
.sp
.in +5
set lfcr = "<lf><cr>".
.in -5
[cc]mc
.sp
If <variable> exists in the current scope or any surrounding scope,
then its value is altered by 'set'; otherwise, it is created at the current
lexical level and then the value is assigned.
.es
set i = 0
set i = [eval i + 1]
[cc]mc |
set lfcr = "<lf><cr>"
set nolfcr = "@<lf>@<cr>"
set atsign = "@@"
[cc]mc
set response =
.sa
declare (1), forget (1), vars (1), save (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
