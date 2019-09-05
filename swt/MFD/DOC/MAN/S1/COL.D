.hd col "convert input to multi-column output" 07/31/80
col { -c <columns> | -g <gutter width> | -i <indent> |
      -l <page length> | -w <column width> | -t }
.ds
'Col' is a filter that reads lines from standard input and writes
multi-column pages on standard output.  The arguments control what
assumptions are made about such things as the size of the input
lines, the length of the output page, the number of columns per
page, and so on; any combination of the following may be used:
.in +5
.ta 6
.de hang
.sp
.ne 3
.ti -5
[1]@[tc]
.en hang
.hang -c
may be used to control the number of columns per page;
it must be followed by a positive integer.
The current implementation of 'col' restricts the maximum number of
columns per page to 8.
If "-c" is omitted, two columns per page is assumed.
.hang -g
may be used to set the width of the "gutters" that separate the
columns from each other; it must be followed by a non-negative
integer.
If "-g" is omitted, five blanks are placed between columns.
.hang -i
may be used to set a running indentation of the left margin and
must also be followed by a non-negative integer.
If no "-i" is given an indentation value of zero is assumed.
.hang -l
may be used to specify the number of lines on each page of output
and must be followed by a positive integer.
If it is omitted, 'col' assumes a page length of 54 lines,
which incidentally is the number lines placed on each page
by the 'print' command.
.hang -w
may be used to set the width of each column and should also be
followed by a positive integer.  To allow lines containing
backspaces and overstruck characters whose length exceed their
printed width, 'col' never truncates input lines; consequently,
best results occur when all the input lines have a printed
width no greater than the specified value.
If "-w" is omitted, three inch wide columns are produced
(i.e., 30 characters per column, printed at 10 characters per inch).
.hang -t
may be used to select parameter values suitable for generating output
on a CRT screen.
Specifically, this option selects five columns of 14 characters each
per 22 line page with two character gutters and no indentation.
The output generated under these parameters is suitable to be
piped into the 'pg' command.
If additional options are used, the parameter values
so specified override those selected by "-t".
.sp
.in -5
.es
file> col | print
files .r$ | col -t | pg
paper> col -c 2 -w 60 -l 66 >/dev/lps
.me
.in +5
.ti -5
"Usage: col ..." for improper arguments.
.ti -5
"too many columns" if more that 8 columns are requested.
.ti -5
"too many lines" if there is inadequate buffer space to hold
an entire page.
.in -5
.bu
The default parameter values are probably wrong.
Misbehaves when input lines contain more backspaces than
printable characters.
.sa
pg (1), print (1)
