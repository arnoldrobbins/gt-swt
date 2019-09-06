.hd sdrop "drop characters from a string APL-style" 03/23/80
integer function sdrop (from, to, length)
character from (ARB), to (ARB)
integer length
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Sdrop' copies all but 'length' characters from the 'from' string
into the 'to' string and returns as its result the number of
characters copied.  If 'length' is positive, the omitted characters
are relative to the beginning of the 'from' string; if it is negative,
they are relative to the end of the string.
.am
to
.ca
ctoc, length, scopy
.sa
stake (2), index (2), substr (2), drop (1)
