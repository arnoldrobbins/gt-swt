.hd unrot "'un-rotate' output produced by kwic" 02/22/82
unrot [ -w <width> ]
.ds
'Unrot' processes the "rotated" output of 'kwic' to generate a
key-word-in-context index.  It reads lines from standard input one and
writes the index on standard output one.
.sp
The length of the output lines may be specified with the
"-w[bl]<width>" argument sequence.  The maximum width is currently
137 characters.  If no width is specified, 65 is assumed.
.es
definitions> kwic | sort | unrot >index
.me
"Usage: unrot ..." for invalid argument syntax.
.sa
kwic (1), sort (1), uniq (1)
