.hd gttype "return the user's terminal type" 03/24/82
integer function gttype (ttype)
character ttype (MAXTERMTYPE)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gttype' obtains the user's terminal type by calling
routines to (1) look in the Subsystem common area, (2)
look in the =termlist= file, and (3) ask the user.  The
terminal type is checked in each case, and if it is
invalid, it is ignored.
The function returns YES if the character string representing
the terminal type is returned in 'ttype' and NO otherwise.
Since 'gttype' will return NO only if the user refuses to
give a terminal type (by entering end-of-file), most
programs just terminate with a call to 'error' if
'gttype' returns NO.
.im
'Gttype' calls 'ttyp$r' to obtain the terminal type from
the common area.  If the string is empty or if the terminal
type in the common area is invalid, it calls 'ttyp$f' to
obtain the terminal type in the "=termlist=" file.  If no
valid type is present in =termlist=, 'gttype' calls 'ttyp$q'
to request the terminal type from the user.
.am
ttype
.ca
ttyp$f, ttyp$q, ttyp$r
.sa
gtattr (2), ttyp$v (6)
