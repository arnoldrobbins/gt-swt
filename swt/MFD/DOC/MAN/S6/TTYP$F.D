.hd ttyp$f "obtain the user's terminal type" 03/25/82
integer function ttyp$f (ttype)
character ttype (MAXTERMTYPE)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ttyp$f' looks in the file "=termlist=" to see if a terminal type
is defined for the user's terminal line.
'Ttyp$f' returns a character string which is the name of the
user's terminal type in 'ttype'.  It returns YES if it could determine
the terminal type, and NO otherwise.
.im
'Ttyp$f' tries to find the terminal name from the terminal
list file in "=termlist=" (nominally "//extra/terms");
if it can find it, it returns the
name found, sets the associated terminal attribute values in the
Subsystem common area, and returns YES.
If the terminal name could not be determined from the "=termlist="
file, it returns NO.
.am
ttype
.ca
ctoi, close, date, getlin, open, ttyp$v
.sa
term_type (1), other ttyp$?* routines (6)
