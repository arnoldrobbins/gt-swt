.hd gtattr "get a user's terminal attributes" 02/24/82
integer function gtattr (attr)
integer attr
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gtattr' returns the value of the attribute 'attr' that the user
desires.   Currently, the following attribute types are accepted[bl]:
.sp
.in +5
.ti -5
TA_SE_USEABLE[bl]-[bl][bl]indicates whether the terminal
can use the screen editor ('se'). The returned value is either YES
or NO.
.sp
.ti -5
TA_VTH_USEABLE[bl]-[bl][bl]indicates whether the terminal
is supported by the Virtual Terminal Handler package (VTH).
The returned value is either YES or NO.
.sp
.ti -5
TA_UPPER_ONLY[bl]-[bl][bl]indicates whether the terminal
supports only the upper case character set.  The returned
value is either YES or NO.
.in -5
.sp
The value of each of the above attributes is set upon entry into the
Subsystem, but can be changed by executing the 'term' command.
.im
'Gtattr' first verifies that the given attribute is a legal
one; if it isn't, then NO is returned.  If the attribute is
legal, its value is obtained from the Subsystem common area
and returned as the function value.
.sa
term (1), term_type (1), VTH routines (vt?*) (2)
