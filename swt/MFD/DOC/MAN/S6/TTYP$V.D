.hd ttyp$v "set terminal attributes" 01/06/83
integer function ttyp$v (ttype)
character ttype (MAXTERMTYPE)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ttyp$v' takes the terminal type name given in 'ttype' and
tries to set the values of that terminal's attributes in the
Subsystem common area.  If the terminal type is not a legal
one, then 'ttyp$v' returns NO and leaves the values of the
terminal attributes undisturbed; otherwise, it sets up the
appropriate values and returns YES.
.im
'Ttyp$v' takes the terminal type given in 'ttype' and tries to
find it in the file "=ttypes=" (nominally "//extra/terms").
If the file could not be opened
or if the terminal type wasn't found in the file, 'ttyp$v' returns
NO; otherwise, it sets the value of the terminal's attributes from
values given in the file and returns a value of YES.
.ca
close, ctoc, equal, input, open, Primos break$
.sa
other ttyp$?* routines (2)
