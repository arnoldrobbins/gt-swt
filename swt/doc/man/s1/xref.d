[cc]mc |
.hd xref "Ratfor cross reference generator" 08/27/84
[cc]mc
xref { -{b | i | l | p | u} } { <pathname> }
.ds
'Xref' produces a cross referenced listing of a Ratfor program.
The listing consists of the program text, with consecutively numbered
lines, and an alphabetical concordance of the identifiers that occur
in the program text.
.sp
The program text is read from the concatenation of all the files
specified as <pathname> arguments.
If there are none, standard input is used.
.sp
Several command line options are available to control the operation
of 'xref':
.sp
.in +5
.ta 4
.tc \
.ti -3
[cc]mc |
-b\highlight keywords by boldfacing.
[cc]mc
Any Ratfor or Fortran keywords contained in the program text
will be boldfaced (by overstriking) in the listing.
If the listing is to be printed on a line printer, the output
should be filtered through 'os' to convert the overstrikes into
multiple lines with Fortran forms control.
.sp
.ti -3
[cc]mc |
-i\process 'include' statements.
[cc]mc
Any 'include' statements encountered in the program text will be
expanded in-line.
The included lines will be numbered consecutively as if they appeared
in the primary input file.
.sp
.ti -3
[cc]mc |
-l\include literals in the concordance.
[cc]mc
Any numeric literals that appear in the program text will be
included with the identifiers in the concordance.
.sp
.ti -3
[cc]mc |
-p\format listing for printing.
[cc]mc
A formfeed will be generated following the listing of each input
file.
Output under this option is suitable for piping into 'pr'.
.sp
.ti -3
[cc]mc |
-u\highlight keywords by underlining.
[cc]mc
Any Ratfor or Fortran keywords contained in the program text
will be underlined (by overstriking) in the listing.
If the listing is to be printed on a line printer, the output
should be filtered through 'os' to convert the overstrikes into
multiple lines with Fortran forms control.
.in -5
.es
rfprog.r> xref
xref -pu prog1 prog2 prog3 | print | os >/dev/lps/f
.sa
os (1), pr (1), rp (1)
