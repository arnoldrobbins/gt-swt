.hd lspos "find position in linked string" 03/23/80
character function lspos (ptr, pos)
pointer ptr
integer pos
.sp
Library:  vlslb
.fs
'Ptr' is updated to point to the string starting at position 'pos'.  'Ptr'
will not be updated past the EOS.  The value returned by the function
is the character in position 'pos'.
.im
The string is traversed until 'pos' - 1 characters have been skipped.
The new pointer is then returned in 'ptr' and as the function value.
.am
ptr
.bu
Locally supported.
