.hd tail "print last n lines from standard input" 01/09/82
tail [ <number of lines> ] [ <file> ]
.ds
'Tail' is a filter that prints on standard output the last few
lines that it reads from standard input.  The number of lines
printed may be specified as an integer argument; the default
value is twenty if none is given.  Currently, the
maximum number of lines that can be printed is 300.  If a number
larger than this is specified, a value of 300 is used and no
error message is issued.
.sp
[cc]mc |
If <number of lines> is preceded by a minus
[cc]mc
sign, 'tail' discards the first <number of lines> lines from
its input file and copies the remainder to standard output.
.sp
If a file name is given as the second argument, 'tail' takes
its input from the named file instead of standard input.
.es
log_file> tail 10
tail 10 log_file
lf -cw | sort | tail 5
listfile> tail -1
tail -1 listfile
.bu
For the single argument case, if argument is the string "0", the program
will read in the default number of lines from file "0".  If the single
argument is a file name that starts with digits, those digits will be
interpreted as the number of lines to be read from standard input.
.sp
For the two argument case, if the first argument is the string "0",
the second argument is ignored and a file name of "0" is assumed.
.sa
slice (1)
