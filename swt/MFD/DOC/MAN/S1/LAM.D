.hd lam "laminate lines from separate files" 03/20/80
lam {-i<string> | <filename>}
.ds
'Lam' is used to combine multiple input streams into one
output stream by placing corresponding lines from each input
stream end-to-end.
For example, if STDIN1 contains
.sp
.in +5
.nf
line #
line #
.fi
.sp
.in -5
and STDIN2 contains
.sp
.in +5
.nf
1
2
.fi
.sp
.in -5
then the result of the command "lam" will be
.sp
.in +5
.nf
line #1
line #2
.fi
.sp
.in -5
If an input stream is shorter than the others, its contribution
to the output is null once it reaches EOF.
.sp
The "-i" arguments may be used to insert arbitrary strings into
the output stream, either before the lamination, after it, or
between any two files.
The string to be inserted must follow the "-i" immediately;
it may not be placed in the following argument.
.sp
If no arguments are given on the command line, standard input 1
is laminated to standard input 2,
i.e. "lam" is equivalent to "lam /dev/stdin1 /dev/stdin2".
Otherwise, at least one file name argument must be supplied
on the command line.
.es
file1> file2> lam >lamination
lam col1 -i\ col2 -i\ /dev/stdin1 | detab -t \
lam -i">>" file >junk
.sa
cat (1), tee (1), common (1), field (1), join (1),
diff (1), take (1), drop (1)
