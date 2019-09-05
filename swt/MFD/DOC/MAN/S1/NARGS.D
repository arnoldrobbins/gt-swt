.hd nargs "print number of command file arguments" 03/20/80
nargs [ <level_offset> ]
.ds
'Nargs' prints the number of arguments supplied on a command line
at some higher level of command file/function call nesting. It is
most often used in a function call within a command file to determine
the number of arguments supplied to that same command file.
.sp
As with the 'arg' and 'args' commands, <level offset> may optionally be
specified to indicate the number of higher nesting levels to skip
before counting. In keeping with its most frequent mode of usage,
the default value is one, so that the nesting level corresponding
to the function call is ignored.
.es
nargs 0
echo [nargs]
.sa
arg (1), args (1), getarg (2)
