.hd length "find length of a string" 03/23/80
integer function length (str)
character str (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Length' returns the length of the string passed as its first parameter.
.im
A simple loop is used to count characters until an EOS is encountered.
.bu
Slow.
