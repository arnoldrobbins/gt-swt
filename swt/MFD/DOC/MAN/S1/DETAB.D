.hd detab "convert tabs to multiple spaces" 02/22/82
.nf
detab { -t <tab character>       |
        -r <replacement string>  |
        <column number>          |
        +<increment> }
.fi
.ds
'Detab' expands tab characters on its first standard input file
into an equivalent number of replacement characters on its first
standard output file.
.sp
The tab character may be specified by an argument following the
"-t" option; if not so specified, the ASCII TAB (ctrl-i) is
assumed. Similarly, the string from which replacement characters
are taken may be specified using the "-r" option. Replacement
characters are taken as needed from the string, starting with
the first and wrapping around to the
beginning when the end of the string is reached. If no
replacement string is specified, a single blank is assumed.
.sp
Any number of tab stops may be set by specifying the desired
column number as an argument.  If the "+<increment>" construct is
used, stops will be set at intervals of <increment> columns,
starting with the most recently set stop.  Thus, the argument
sequence
.sp
          10 +5
.sp
would set stops in columns 10, 15, 20, etc.
In the absence of any other specification, default stops are
set in every fourth column, starting with column five.
.es
file1> detab 21 36 41 66 -r " ." >file2
cat subr1 subr2 subr3 | detab +3 >prog.r
assembler.s> detab -t \ 10 20 35 >asm.s
.me
"Usage: detab ..." for incorrect arguments.
.sa
entab (1)
