.hd arg "print command file arguments" 03/20/80
arg <argument_number> [ <level_offset> ]
.ds
'Arg' is used from within a shell program to print an argument
specified on the command line that invoked that shell program.
<Argument_number> is the
ordinal position of the argument desired. (A value of zero
corresponds to the command name, one corresponds to the first
argument, etc.)
<Level_offset> is used to specify the number of
levels of nested input files and/or function calls that are to
be skipped before fetching the specified argument string. A value
of zero means fetch the argument from the first higher nesting level;
one means skip one level to the second higher level, etc.
The string thus obtained is printed on standard output 1, followed
by a newline.
.sp
Since 'arg' is typically used in a function call within a shell program,
the default value of <level offset> is one, so that the level
corresponding to the function call is skipped and the shell program
arguments are accessed.
.sp
If <argument number> is out of range for the specified level, the
empty string is returned and only a newline is printed.
.es
print [arg 1]     # These two commands fetch the
arg 1 0           # same argument.
.sp
echo [arg 1] [arg 2] [arg 3]
.sa
args (1), nargs (1), getarg (2),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
