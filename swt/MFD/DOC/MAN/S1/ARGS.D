.hd args "print command file arguments" 03/20/80
args <first_argument> [ <last_argument> [ <level_offset> ] ]
.ds
'Args' is similar in function to the 'arg' command, except that
multiple arguments are printed. The first argument printed is
specified by <first_argument>.
If
.nh
<last_argument>
.hy
is specified,
all succeeding arguments up to and including it are printed, separated
from each other by newlines. Otherwise, all remaining arguments
are printed, again, separated from each other by newlines.
.sp
Unlike 'arg', a newline is printed only if at least one argument
was printed.
.es
print [args 1]
pr [args 3 5]
.bu
There is no way to specify a <level_offset> without specifying
a <last_argument>.
.sa
arg (1), nargs (1), getarg (2),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
