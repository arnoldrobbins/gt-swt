.hd entab "convert multiple blanks to tabs" 03/20/80
.nf
entab { -t <tab character> |
        <column number>    |
        +<increment> }
.fi
.ds
'Entab' converts multiple blanks on its first standard input
into an equivalent number of blanks and tab characters on its
first standard output.  The tab character may be specified as
an argument with the "-t <tab character>" argument sequence;
otherwise, the ASCII TAB (ctrl-i) is used.
.sp
Any number of tab stops may be set by specifying the desired
column numbers as arguments.  If the +<increment> construct is
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
prog.f> entab 7 >compressed_prog.f
term_paper> entab -t \
.me
.in +5
.ti -5
"Usage: entab ..." for incorrect arguments.
.in -5
.sa
detab (1)
