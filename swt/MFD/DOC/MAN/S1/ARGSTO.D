.hd argsto "print command file arguments" 04/28/80
argsto <delim> [<num> [<start> [<level_offset>]]]
.ds
'Argsto' is used from within a shell program to print a group
of arguments
specified on the command line that invoked that shell program.
'Argsto' prints the group of arguments delimited by arguments
consisting of the string <delim>.  <Num> is an integer that
controls which group of arguments is printed.  If <number> is
0 or omitted, arguments up to the first occurrence of
<delim> are printed; if <number> is 1, arguments between the
first occurrence and second occurrence of <delim> are printed,
and so on.  <Start> is an integer indicating the argument at
which the scan is to begin;  if <start> is omitted (or is 1),
the scan begins at the first argument.
.sp
<Level_offset> is used to specify the number of
levels of nested input files and/or function calls that are to
be skipped before fetching the specified argument string. A value
of zero means fetch the argument from the first higher nesting level;
one means skip one level to the second higher level, etc.
The strings thus obtained are printed on standard output 1, followed
by a newlines.
.sp
Since 'argsto' is typically used in a function call within a shell program,
the default value of <level offset> is one, so that the level
corresponding to the function call is skipped and the shell program
arguments are accessed.
.es
rp [argsto / 2]
fc [argsto / 1]
.sa
args (1), nargs (1), getarg (2),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
