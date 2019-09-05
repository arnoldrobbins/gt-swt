.hd ttyp$q "query for the terminal type from the user" 03/25/82
integer function ttyp$q (ttype, blankok)
character ttype (MAXTERMTYPE)
integer blankok
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ttyp$q' asks the user for the name of his terminal.  If an
unknown terminal type is specified, the user is given the
option of having the known terminal types listed by entering
either a "?" or "help" or entering a valid terminal type.
If a valid terminal type was given by the user, the function
returns YES; otherwise, the function return value is NO.
For valid user responses, 'ttype' contains the terminal type
name.
.im
After a user response is entered, it is mapped to lower case
(for consistency).  If a null response is entered and is permitted
by the caller (i.e., 'blankok' is YES), then all terminal type
information in the Subsystem common area is erased; otherwise,
the terminal type entered is
validated.  If it is a valid terminal type, the values of its
attributes are set; otherwise, the user is asked to enter a
correct response or a help request.
.am
ttype
.ca
ctoc, equal, input, mapstr, print, ttyp$l, ttyp$v
.sa
se (1), term (1), term_type (1), other ttyp$?* routines (6)
