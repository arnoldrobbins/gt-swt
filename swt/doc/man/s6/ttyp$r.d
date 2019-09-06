.hd ttyp$r "return the terminal type from the common area" 03/25/82
integer function ttyp$r (ttype)
character ttype (MAXTERMTYPE)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ttyp$r' retrieves the name of the terminal from the Subsystem common
area, if it has been previously set.  If a valid name is found, the
function returns YES; otherwise, it returns NO.
.im
'Ttyp$r' calls 'chkstr' to see if a valid terminal name has been
set in the Subsystem common area.  If an invalid terminal name
has been set, it clears the name and returns NO; otherwise, it
copies the name to 'ttype' and returns YES.
.am
ttype
.ca
chkstr, ctoc
.sa
term (1), term_type (1), other ttyp$?* routines (6)
