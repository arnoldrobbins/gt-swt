.hd quote "enquote strings from standard input" 02/22/82
quote
.ds
'Quote' supplies one layer of quotes around strings present on
its standard input.  It is useful in function calls, to prevent
premature evaluation of text by the command interpreter.
.sp
For example, suppose the string
.sp
     "# [a-d]"
.sp
were specified as an argument in the invocation of a command file
which, in turn, passed the string as an argument to another program
or command file.  The first command file might access the string
using the 'arg' command in a function call:
.sp
     [arg 1]
.sp
However, to prevent the meta-characters "#", "[" and "]" from
being interpreted by the shell after the evaluation of the function,
the following function call should be used instead:
.sp
     [arg 1 | quote]
.sp
The string will then be quoted before being substituted back into
the command line containing the function call, and the meta-characters
will not be evaluated.
.sp
The result of a function call is quoted automatically by the shell
if the variable '_quote_opt' contains the string "YES".  This, however,
is not the default setting.
.es
to ics002 [args | quote]
echo [arg 1 | quote] >request_file
.bu
Depends on having both ' and " available as quoting characters.
.sp
Is probably too smart for general application, but understands
the shell's quoting requirements quite well.
.sa
sh (1), arg (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
